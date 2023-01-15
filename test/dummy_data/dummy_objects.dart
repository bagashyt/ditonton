import 'package:ditonton/data/models/movie_table.dart';
import 'package:ditonton/data/models/tv_table.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/entities/tv_detail.dart';

final testMovie = Movie(
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

final testTv = Tv(
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

final testMovieList = [testMovie];

final testTvList = [testTv];

final testMovieDetail = MovieDetail(
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

final testTvDetail = TvDetail(
  adult: false,
  backdropPath: "/iHSwvRVsRyxpX7FE7GbviaDvgGZ.jpg",
  firstAirDate: "2022-11-23",
  genres: [Genre(id: 9648, name: "Mystery")],
  homepage: "https://www.netflix.com/title/81231974",
  id: 119051,
  inProduction: true,
  languages: ["en"],
  lastAirDate: "2022-11-23",
  name: "Wednesday",
  nextEpisodeToAir: null,
  numberOfEpisodes: 8,
  numberOfSeasons: 2,
  originalLanguage: "en",
  originalName: "Wednesday",
  overview:
      "Wednesday Addams is sent to Nevermore Academy, a bizarre boarding school where she attempts to master her psychic powers, stop a monstrous killing spree of the town citizens, and solve the supernatural mystery that affected her family 25 years ago — all while navigating her new relationships.",
  popularity: 2733.85,
  posterPath: "/9PFonBhy4cQy7Jz20NpMygczOkv.jpg",
  status: "Returning Series",
  tagline: "",
  type: "Scripted",
  voteAverage: 8.674,
  voteCount: 5226,
);

final testWatchlistMovie = Movie.watchlist(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testWatchlistTv = Tv.watchlist(
  id: 1,
  overview: 'overview',
  posterPath: 'posterPath',
  name: 'name',
);

final testMovieTable = MovieTable(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testTvTable = TvTable(
  id: 1,
  name: 'name',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
};

final testTvMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
};
