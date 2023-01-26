import 'package:ditonton/common/show_type.dart';
import 'package:ditonton/presentation/pages/about_page.dart';
import 'package:ditonton/presentation/pages/home_movie_page.dart';
import 'package:ditonton/presentation/pages/home_tv_page.dart';
import 'package:ditonton/presentation/pages/search_page.dart';
import 'package:ditonton/presentation/pages/watchlist_movies_page.dart';
import 'package:ditonton/presentation/pages/watchlist_tv_page.dart';
import 'package:ditonton/presentation/provider/home_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const ROUTE_NAME = '/home';
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(builder: (context, data, child) {
      ShowType activeShowType = data.selectedShowType;

      return Scaffold(
        key: _drawerKey,
        drawer: _buildDrawer(context, (ShowType showType) {
          data.setSelectedShowType(showType);
        }, activeShowType),
        appBar: _buildAppBar(context, activeShowType),
        body: _buildBody(context, activeShowType),
      );
    });
  }

  Widget _buildBody(BuildContext context, ShowType activeShowType) {
    if (activeShowType == ShowType.tv) {
      return HomeTvPage();
    } else {
      return HomeMoviePage();
    }
  }

  AppBar _buildAppBar(
    BuildContext context,
    ShowType activeShowType,
  ) {
    return AppBar(
      title: Text('Ditonton'),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              SearchPage.ROUTE_NAME,
              arguments: activeShowType,
            );
          },
          icon: Icon(Icons.search),
        ),
      ],
    );
  }

  Drawer _buildDrawer(
    BuildContext context,
    Function(ShowType) itemCallback,
    ShowType activeShowType,
  ) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/circle-g.png'),
            ),
            accountName: Text('Ditonton'),
            accountEmail: Text('ditonton@dicoding.com'),
          ),
          ListTile(
            leading: Icon(Icons.movie),
            title: Text('Movie'),
            onTap: () {
              Navigator.pop(context);
              itemCallback(ShowType.movie);
            },
          ),
          ListTile(
            leading: Icon(Icons.tv),
            title: Text('Tv'),
            onTap: () {
              Navigator.pop(context);
              itemCallback(ShowType.tv);
            },
          ),
          ListTile(
            leading: Icon(Icons.save_alt),
            title: Text('Movie Watchlist'),
            onTap: () {
              Navigator.pushNamed(context, WatchlistMoviesPage.ROUTE_NAME);
            },
          ),
          ListTile(
            leading: Icon(Icons.save_alt),
            title: Text('TV Watchlist'),
            onTap: () {
              Navigator.pushNamed(context, WatchlistTvPage.ROUTE_NAME);
            },
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
            },
            leading: Icon(Icons.info_outline),
            title: Text('About'),
          ),
        ],
      ),
    );
  }
}
