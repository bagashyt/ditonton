import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';
import 'package:ditonton/common/failure.dart';

class GetTvWatchlist {
  final TvRepository _repository;

  GetTvWatchlist(this._repository);

  Future<Either<Failure, List<Tv>>> execute() {
    return _repository.getTvWatchlist();
  }
}
