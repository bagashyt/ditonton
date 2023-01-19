import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/usecases/movie/search_movies.dart';
import 'package:ditonton/domain/usecases/tv/search_tv.dart';
import 'package:ditonton/presentation/provider/search_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_notifier_test.mocks.dart';

@GenerateMocks([SearchMovies, SearchTv])
void main() {
  late SearchNotifier provider;
  late MockSearchMovies mockSearchMovies;
  late MockSearchTv mockSearchTv;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockSearchMovies = MockSearchMovies();
    mockSearchTv = MockSearchTv();
    provider =
        SearchNotifier(searchMovies: mockSearchMovies, searchTv: mockSearchTv)
          ..addListener(() {
            listenerCallCount += 1;
          });
  });

  final tMovieModel = Movie(
    adult: false,
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: [14, 28],
    id: 557,
    originalTitle: 'Spider-Man',
    overview:
        'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    releaseDate: '2002-05-01',
    title: 'Spider-Man',
    video: false,
    voteAverage: 7.2,
    voteCount: 13507,
  );
  final tMovieList = <Movie>[tMovieModel];
  final tMovieQuery = 'spiderman';

  final tTvModel = Tv(
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: [14, 28],
    id: 557,
    name: 'Wednesday',
    overview:
        'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    firstAirDate: '2002-05-01',
    voteAverage: 7.2,
    voteCount: 13507,
    originalName: 'Wednesday',
    originCountry: [],
    originalLanguage: '',
  );
  final tTvList = <Tv>[tTvModel];
  final tTvQuery = 'Wednesday';

  group('search movies', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockSearchMovies.execute(tMovieQuery))
          .thenAnswer((_) async => Right(tMovieList));
      // act
      provider.fetchMovieSearch(tMovieQuery);
      // assert
      expect(provider.state, RequestState.Loading);
    });

    test('should change search result data when data is gotten successfully',
        () async {
      // arrange
      when(mockSearchMovies.execute(tMovieQuery))
          .thenAnswer((_) async => Right(tMovieList));
      // act
      await provider.fetchMovieSearch(tMovieQuery);
      // assert
      expect(provider.state, RequestState.Loaded);
      expect(provider.searchMovieResult, tMovieList);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockSearchMovies.execute(tMovieQuery))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchMovieSearch(tMovieQuery);
      // assert
      expect(provider.state, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });

  group('search tv', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockSearchTv.execute(tTvQuery))
          .thenAnswer((_) async => Right(tTvList));
      // act
      provider.fetchTvSearch(tTvQuery);
      // assert
      expect(provider.state, RequestState.Loading);
    });

    test('should change search result data when data is gotten successfully',
        () async {
      // arrange
      when(mockSearchTv.execute(tTvQuery))
          .thenAnswer((_) async => Right(tTvList));
      // act
      await provider.fetchTvSearch(tTvQuery);
      // assert
      expect(provider.state, RequestState.Loaded);
      expect(provider.searchTvResult, tTvList);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockSearchTv.execute(tTvQuery))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchTvSearch(tTvQuery);
      // assert
      expect(provider.state, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });
}
