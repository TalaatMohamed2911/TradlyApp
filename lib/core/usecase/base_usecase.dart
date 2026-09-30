import 'package:dartz/dartz.dart';
import 'package:tradly/core/error/failure.dart';

abstract class BaseUsecase<In, out> {
  Future<Either<Failure, out>> execute(In input);
}
