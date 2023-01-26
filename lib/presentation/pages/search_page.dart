import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/show_type.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/presentation/provider/search_notifier.dart';
import 'package:ditonton/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  static const ROUTE_NAME = '/search';
  final ShowType showType;

  const SearchPage({Key? key, required this.showType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(showType == ShowType.movie ? 'Search Movie' : 'Search Tv'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onSubmitted: (query) {
                switch (showType) {
                  case ShowType.movie:
                    Provider.of<SearchNotifier>(context, listen: false)
                        .fetchMovieSearch(query);
                    break;
                  case ShowType.tv:
                    Provider.of<SearchNotifier>(context, listen: false)
                        .fetchTvSearch(query);
                    break;
                }
              },
              decoration: InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            SizedBox(height: 16),
            Text(
              'Search Result',
              style: kHeading6,
            ),
            Consumer<SearchNotifier>(
              builder: (context, data, child) {
                if (data.state == RequestState.Loading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (data.state == RequestState.Loaded) {
                  late final List<Tv> tv;
                  switch (showType) {
                    case ShowType.movie:
                      final movie = data.searchMovieResult;
                      return Expanded(
                        child: ListView.builder(
                          itemBuilder: ((context, index) {
                            final _movie = movie[index];
                            return MovieCard(
                              showType: showType,
                              movie: _movie,
                            );
                          }),
                          itemCount: movie.length,
                        ),
                      );
                    case ShowType.tv:
                      tv = data.searchTvResult;
                      return Expanded(
                        child: ListView.builder(
                          itemBuilder: ((context, index) {
                            final _tv = tv[index];
                            return MovieCard(
                              showType: showType,
                              tv: _tv,
                            );
                          }),
                          itemCount: tv.length,
                        ),
                      );
                  }
                } else {
                  return Expanded(
                    child: Container(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
