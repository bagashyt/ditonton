import 'package:ditonton/data/models/movie_table.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tMovieTable = MovieTable(
    id: 1,
    title: 'title',
    posterPath: 'posterPath',
    overview: 'overview',
  );

  final tMovieWatchlist = Movie.watchlist(
    id: 1,
    overview: 'overview',
    posterPath: 'posterPath',
    title: 'title',
  );

  final tMovieJson = {
    'id': 1,
    'overview': 'overview',
    'posterPath': 'posterPath',
    'title': 'title'
  };

  test('should subclass of entity', () async{
    final result = tMovieTable.toEntity();
    expect(result, tMovieWatchlist);
  });

  test('should be return to json', () async {
    final result = tMovieTable.toJson();
    expect(result, tMovieJson);
  });
}
