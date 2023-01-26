import 'dart:convert';

import 'package:ditonton/data/models/tv_model.dart';
import 'package:ditonton/data/models/tv_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../json_reader.dart';

void main() {
  final tTvModel = TvModel(
    backdropPath: "/3FLHePl9Y3n4BidLVjIA9qSRDOE.jpg",
    firstAirDate: "2021-08-03",
    genreIds: [10766],
    id: 130542,
    name: "Bhagya Lakshmi",
    originCountry: ["IN"],
    originalLanguage: "hi",
    originalName: "Bhagya Lakshmi",
    overview: "Hailing from a middle-class family, Lakshmi’s life is upended when she realises that her marriage to Rishi Oberoi, an industrialist’s son, is a sham to keep his death at bay.",
    popularity: 1587.266,
    posterPath: "/7wuKrFvbX7kAIF0ctotARsqayPo.jpg",
    voteAverage: 5.8,
    voteCount: 10
  );
  final tTvResponseModel =
      TvResponse(tvList: <TvModel>[tTvModel]);
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/tv_now_playing.json'));
      // act
      final result = TvResponse.fromJson(jsonMap);
      // assert
      expect(result, tTvResponseModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      final result = tTvResponseModel.toJson();
      final expectedJsonMap = {
        "results": [
          {
            "backdrop_path": "/3FLHePl9Y3n4BidLVjIA9qSRDOE.jpg",
            "first_air_date": "2021-08-03",
            "genre_ids": [
              10766
            ],
            "id": 130542,
            "name": "Bhagya Lakshmi",
            "origin_country": [
              "IN"
            ],
            "original_language": "hi",
            "original_name": "Bhagya Lakshmi",
            "overview": "Hailing from a middle-class family, Lakshmi’s life is upended when she realises that her marriage to Rishi Oberoi, an industrialist’s son, is a sham to keep his death at bay.",
            "popularity": 1587.266,
            "poster_path": "/7wuKrFvbX7kAIF0ctotARsqayPo.jpg",
            "vote_average": 5.8,
            "vote_count": 10
          }
        ],
      };
      expect(result, expectedJsonMap);
    });
  });
}
