import 'package:ditonton/data/models/genre_model.dart';
import 'package:ditonton/data/models/tv_detail_model.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/tv_detail.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tTvDetailResponse = TvDetailResponse(
    adult: false,
    backdropPath: 'backdropPath',
    firstAirDate: 'firstAirDate',
    genres: [GenreModel(id: 1, name: 'Action')],
    homepage: 'homepage',
    id: 1,
    inProduction: false,
    languages: ['languages'],
    lastAirDate: 'lastAirDate',
    name: 'name',
    nextEpisodeToAir: 'nextEpisodeToAir',
    numberOfEpisodes: 1,
    numberOfSeasons: 1,
    originalLanguage: 'originalLanguage',
    originalName: 'originalName',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    status: 'status',
    tagline: 'tagline',
    type: 'type',
    voteAverage: 1,
    voteCount: 1,
  );

  final tTvDetail = TvDetail(
    adult: false,
    backdropPath: 'backdropPath',
    firstAirDate: 'firstAirDate',
    genres: [Genre(id: 1, name: 'Action')],
    homepage: 'homepage',
    id: 1,
    inProduction: false,
    languages: ['languages'],
    lastAirDate: 'lastAirDate',
    name: 'name',
    nextEpisodeToAir: 'nextEpisodeToAir',
    numberOfEpisodes: 1,
    numberOfSeasons: 1,
    originalLanguage: 'originalLanguage',
    originalName: 'originalName',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    status: 'status',
    tagline: 'tagline',
    type: 'type',
    voteAverage: 1,
    voteCount: 1,
  );

  final tTvJson = {
    'adult': false,
    'backdrop_path': 'backdropPath',
    'first_air_date': 'firstAirDate',
    'genres': [{'id': 1, 'name': 'Action'}],
    'homepage': 'homepage',
    'id': 1,
    'in_production': false,
    'languages': ['languages'],
    'last_air_date': 'lastAirDate',
    'name': 'name',
    'next_episode_to_air': 'nextEpisodeToAir',
    'number_of_episodes': 1,
    'number_of_seasons': 1,
    'original_language': 'originalLanguage',
    'original_name': 'originalName',
    'overview': 'overview',
    'popularity': 1.0,
    'poster_path': 'posterPath',
    'status': 'status',
    'tagline': 'tagline',
    'type': 'type',
    'vote_average': 1.0,
    'vote_count': 1
  };

  test('should be sub class of entity', () async {
    final result = tTvDetailResponse.toEntity();
    expect(result, tTvDetail);
  });

  test('should be return to json', () async {
    final result = tTvDetailResponse.toJson();
    expect(result, tTvJson);
  });
}
