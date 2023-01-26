import 'package:ditonton/data/models/tv_table.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tTvTable = TvTable(
    id: 1,
    name: 'name',
    posterPath: 'posterPath',
    overview: 'overview',
  );

  final tTvWatchlist = Tv.watchlist(
    id: 1,
    overview: 'overview',
    posterPath: 'posterPath',
    name: 'name',
  );

  final tTvJson = {
    'id': 1,
    'name': 'name',
    'posterPath': 'posterPath',
    'overview': 'overview',
  };

  test('should be subclass of entity', () async {
    final result = tTvTable.toEntity();
    expect(result, tTvWatchlist);
  });

  test('should be return to json', () async {
    final result = tTvTable.toJson();
    expect(result, tTvJson);
  });
}
