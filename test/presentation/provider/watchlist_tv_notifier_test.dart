import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_watchlist.dart';
import 'package:ditonton/presentation/provider/watchlist_tv_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'watchlist_tv_notifier_test.mocks.dart';

@GenerateMocks([GetTvWatchlist])
void main() {
  late WatchlistTvNotifier provider;
  late MockGetTvWatchlist mockGetTvWatchlist;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetTvWatchlist = MockGetTvWatchlist();
    provider = WatchlistTvNotifier(getWatchlistTv: mockGetTvWatchlist)
      ..addListener(() {
        listenerCallCount += 1;
      });
  });

  test('should change tv data when data is retrieve successfully', () async {
    // arrange
    when(mockGetTvWatchlist.execute()).thenAnswer((_) async=> Right([testWatchlistTv]));
    // act
    await provider.fetchWatchlistTv();
    // assert
    expect(provider.watchlistState, RequestState.Loaded);
    expect(provider.watchlistTv, [testWatchlistTv]);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is failed', () async {
    // arrange
    when(mockGetTvWatchlist.execute()).thenAnswer((_) async => Left(DatabaseFailure("Can't get data")));
    // act
    await provider.fetchWatchlistTv();
    // assert
    expect(provider.watchlistState, RequestState.Error);
    expect(provider.message, "Can't get data");
    expect(listenerCallCount, 2);
  });
}
