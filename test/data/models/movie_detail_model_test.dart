import 'package:ditonton/data/models/genre_model.dart';
import 'package:ditonton/data/models/movie_detail_model.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tMovieDetail = MovieDetail(
    adult: false,
    backdropPath: 'backdropPath',
    genres: [Genre(id: 1, name: 'Action')],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    runtime: 120,
    title: 'title',
    voteAverage: 1,
    voteCount: 1,
  );

  final tMovieDetailResponse = MovieDetailResponse(
    adult: false,
    backdropPath: 'backdropPath',
    genres: [GenreModel(id: 1, name: 'Action')],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    runtime: 120,
    title: 'title',
    voteAverage: 1,
    voteCount: 1,
    budget: 1,
    homepage: 'homepage',
    imdbId: '1',
    originalLanguage: 'en',
    popularity: 1,
    revenue: 1,
    status: 'status',
    tagline: 'tagline',
    video: false,
  );

  final tMovieDetailJson = {
    'adult': false,
    'backdrop_path': 'backdropPath',
    'budget': 1,
    'genres': [
      {'id': 1, 'name': 'Action'}
    ],
    'homepage': 'homepage',
    'id': 1,
    'imdb_id': '1',
    'original_language': 'en',
    'original_title': 'originalTitle',
    'overview': 'overview',
    'popularity': 1.0,
    'poster_path': 'posterPath',
    'release_date': 'releaseDate',
    'revenue': 1,
    'runtime': 120,
    'status': 'status',
    'tagline': 'tagline',
    'title': 'title',
    'video': false,
    'vote_average': 1.0,
    'vote_count': 1
  };

  test('should be subclass of entity', () async {
    final result = tMovieDetailResponse.toEntity();
    expect(result, tMovieDetail);
  });

  test('should be return to json', () async {
    final result = tMovieDetailResponse.toJson();
    expect(result, tMovieDetailJson);
  });
}
