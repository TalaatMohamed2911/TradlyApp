import 'package:dartz/dartz.dart';
import 'package:tradly/features/authentication/data/model/requests.dart';
import 'package:tradly/features/authentication/domain/entity/user.dart';
import '../../../../core/error/failure.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
  Future<Either<Failure, Authentication>> register(
    RegisterRequest registerRequest,
  );
  Future<Either<Failure, ResetPassword>> resetPassword(String email);
}
