import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/models/genre_model.dart';
import 'package:ditonton/data/models/tv_detail_model.dart';
import 'package:ditonton/data/models/tv_model.dart';
import 'package:ditonton/data/repositories/tv_repository_impl.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late TvRepositoryImpl repository;
  late MockTvRemoteDataSource mockTvRemoteDataSource;
  late MockTvLocalDataSource mockTvLocalDataSource;

  setUp(() {
    mockTvRemoteDataSource = MockTvRemoteDataSource();
    mockTvLocalDataSource = MockTvLocalDataSource();
    repository = TvRepositoryImpl(
      remoteDataSource: mockTvRemoteDataSource,
      localDataSource: mockTvLocalDataSource,
    );
  });

  final tTvModel = TvModel(
    backdropPath: "/iHSwvRVsRyxpX7FE7GbviaDvgGZ.jpg",
    firstAirDate: "2022-11-23",
    genreIds: [9648, 35],
    id: 119051,
    name: "Wednesday",
    originCountry: ["US"],
    originalLanguage: "en",
    originalName: "Wednesday",
    overview:
        "Wednesday Addams is sent to Nevermore Academy, a bizarre boarding school where she attempts to master her psychic powers, stop a monstrous killing spree of the town citizens, and solve the supernatural mystery that affected her family 25 years ago — all while navigating her new relationships.",
    popularity: 2733.85,
    posterPath: "/9PFonBhy4cQy7Jz20NpMygczOkv.jpg",
    voteAverage: 8.674,
    voteCount: 5226,
  );

  final tTv = Tv(
    backdropPath: "/iHSwvRVsRyxpX7FE7GbviaDvgGZ.jpg",
    firstAirDate: "2022-11-23",
    genreIds: [9648, 35],
    id: 119051,
    name: "Wednesday",
    originCountry: ["US"],
    originalLanguage: "en",
    originalName: "Wednesday",
    overview:
        "Wednesday Addams is sent to Nevermore Academy, a bizarre boarding school where she attempts to master her psychic powers, stop a monstrous killing spree of the town citizens, and solve the supernatural mystery that affected her family 25 years ago — all while navigating her new relationships.",
    popularity: 2733.85,
    posterPath: "/9PFonBhy4cQy7Jz20NpMygczOkv.jpg",
    voteAverage: 8.674,
    voteCount: 5226,
  );

  final tTvModelList = <TvModel>[tTvModel];
  final tTvList = <Tv>[tTv];

  group('Now Playing Tv', () {
    test(
        'should return remote data when the call to remote data source is success',
        () async {
      // arrange
      when(mockTvRemoteDataSource.getNowPlayingTv())
          .thenAnswer((_) async => tTvModelList);
      // act
      final result = await repository.getNowPlayingTv();
      // assert
      verify(mockTvRemoteDataSource.getNowPlayingTv());
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvList);
    });

    test(
        'should return server failure when the call to remote data source is failed',
        () async {
      // arrange
      when(mockTvRemoteDataSource.getNowPlayingTv())
          .thenThrow(ServerException());
      // act
      final result = await repository.getNowPlayingTv();
      // assert
      verify(mockTvRemoteDataSource.getNowPlayingTv());
      expect(result, equals(Left(ServerFailure(''))));
    });
  });

  group('Popular Tv', () {
    test(
        'should return list tv remote data when the call to remote data source is success',
        () async {
      // arrange
      when(mockTvRemoteDataSource.getPopularTv())
          .thenAnswer((_) async => tTvModelList);
      // act
      final result = await repository.getPopularTv();
      // assert
      verify(mockTvRemoteDataSource.getPopularTv());
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvList);
    });

    test(
        'should return server failure when the call to remote data source is failed',
        () async {
      // arrange
      when(mockTvRemoteDataSource.getPopularTv()).thenThrow(ServerException());
      // act
      final result = await repository.getPopularTv();
      // assert
      verify(mockTvRemoteDataSource.getPopularTv());
      expect(result, equals(Left(ServerFailure(''))));
    });
  });

  group('Top Rated Tv', () {
    test(
        'should return list tv remote data when the call to remote data source is success',
        () async {
      // arrange
      when(mockTvRemoteDataSource.getTopRatedTv())
          .thenAnswer((_) async => tTvModelList);
      // act
      final result = await repository.getTopRatedTv();
      // assert
      verify(mockTvRemoteDataSource.getTopRatedTv());
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvList);
    });

    test(
        'should return server failure when the call to remote data source is failed',
        () async {
      // arrange
      when(mockTvRemoteDataSource.getTopRatedTv()).thenThrow(ServerException());
      // act
      final result = await repository.getTopRatedTv();
      // assert
      verify(mockTvRemoteDataSource.getTopRatedTv());
      expect(result, equals(Left(ServerFailure(''))));
    });
  });

  group('Search Tv', () {
    final tQuery = 'wednesday';

    test(
        'should return list tv remote data when the call to remote data source is success',
        () async {
      // arrange
      when(mockTvRemoteDataSource.searchTv(tQuery))
          .thenAnswer((_) async => tTvModelList);
      // act
      final result = await repository.searchTv(tQuery);
      // assert
      verify(mockTvRemoteDataSource.searchTv(tQuery));
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvList);
    });

    test(
        'should return server failure when the call to remote data source is failed',
        () async {
      // arrange
      when(mockTvRemoteDataSource.searchTv(tQuery))
          .thenThrow(ServerException());
      // act
      final result = await repository.searchTv(tQuery);
      // assert
      verify(mockTvRemoteDataSource.searchTv(tQuery));
      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return server failure when the call to remote data source is failed',
        () async {
      // arrange
      when(mockTvRemoteDataSource.searchTv(tQuery))
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.searchTv(tQuery);
      // assert
      expect(
          result, Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Get Tv Recommendations', () {
    final tTvList = <TvModel>[];
    final tId = 1;

    test(
        'should return list tv remote data when the call to remote data source is success',
        () async {
      // arrange
      when(mockTvRemoteDataSource.getTvRecommendations(tId))
          .thenAnswer((_) async => tTvList);
      // act
      final result = await repository.getTvRecommendations(tId);
      // assert
      verify(mockTvRemoteDataSource.getTvRecommendations(tId));
      final resultList = result.getOrElse(() => []);
      expect(resultList, equals(tTvList));
    });

    test(
        'should return server failure when the call to remote data source is failed',
        () async {
      // arrange
      when(mockTvRemoteDataSource.getTvRecommendations(tId))
          .thenThrow(ServerException());
      // act
      final result = await repository.getTvRecommendations(tId);
      // assert
      verify(mockTvRemoteDataSource.getTvRecommendations(tId));
      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return server failure when the call to remote data source is failed',
        () async {
      // arrange
      when(mockTvRemoteDataSource.getTvRecommendations(tId))
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getTvRecommendations(tId);
      // assert
      expect(
          result, Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Get Tv Detail', () {
    final tId = 1;
    final tTvResponse = TvDetailResponse(
      adult: false,
      backdropPath: "/iHSwvRVsRyxpX7FE7GbviaDvgGZ.jpg",
      firstAirDate: "2022-11-23",
      genres: [GenreModel(id: 9648, name: "Mystery")],
      homepage: "https://www.netflix.com/title/81231974",
      id: 1,
      inProduction: true,
      languages: ["en"],
      lastAirDate: "2022-11-23",
      name: "name",
      nextEpisodeToAir: null,
      numberOfEpisodes: 8,
      numberOfSeasons: 2,
      originalLanguage: "en",
      originalName: "Wednesday",
      overview: "overview",
      popularity: 2733.85,
      posterPath: "posterPath",
      status: "Returning Series",
      tagline: "",
      type: "Scripted",
      voteAverage: 8.674,
      voteCount: 5226,
    );

    test(
        'should return tv remote data when the call to remote data source is success',
        () async {
      // arrange
      when(mockTvRemoteDataSource.getTvDetail(tId))
          .thenAnswer((_) async => tTvResponse);
      // act
      final result = await repository.getTvDetail(tId);
      // assert
      verify(mockTvRemoteDataSource.getTvDetail(tId));
      expect(result, equals(Right(testTvDetail)));
    });

    test(
        'should return server failure when the call to remote data source is failed',
        () async {
      // arrange
      when(mockTvRemoteDataSource.getTvDetail(tId))
          .thenThrow(ServerException());
      // act
      final result = await repository.getTvDetail(tId);
      // assert
      verify(mockTvRemoteDataSource.getTvDetail(tId));
      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return server failure when the call to remote data source is failed',
        () async {
      // arrange
      when(mockTvRemoteDataSource.getTvDetail(tId))
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getTvDetail(tId);
      // assert
      expect(
          result, Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Save Watchlist Tv', () {
    test('should return success message when saving successful', () async {
      // arrange
      when(mockTvLocalDataSource.insertWatchingList(testTvTable))
          .thenAnswer((_) async => 'Added to Watchlist');
      // act
      final result = await repository.saveTvWatchlist(testTvDetail);
      // assert
      expect(result, Right('Added to Watchlist'));
    });

    test('should return DabaseFailure when saving is failed', () async {
      // arrange
      when(mockTvLocalDataSource.insertWatchingList(testTvTable))
          .thenThrow(DatabaseException('Failed to add watchlist'));
      // act
      final result = await repository.saveTvWatchlist(testTvDetail);
      // assert
      expect(result, Left(DatabaseFailure('Failed to add watchlist')));
    });
  });

  group('get watchlist status', () {
    test('should return watch status when data is found', () async {
      // arrange
      final tId = 1;
      when(mockTvLocalDataSource.getTvById(tId)).thenAnswer((_) async => null);
      // act
      final result = await repository.isAddedToTvWatchlist(tId);
      // assert
      expect(result, false);
    });
  });

  group('get wathclist list', () {
    test('should return list of Tv', () async {
      // arrange
      when(mockTvLocalDataSource.getWatchlistTv())
          .thenAnswer((_) async => [testTvTable]);
      // act
      final result = await repository.getTvWatchlist();
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, [testWatchlistTv]);
    });
  });
}
