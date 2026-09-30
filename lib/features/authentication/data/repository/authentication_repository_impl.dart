import 'package:dartz/dartz.dart';
import 'package:tradly/core/error/error_handler.dart';
import 'package:tradly/core/error/failure.dart';
import 'package:tradly/features/authentication/data/mapper/mapper.dart';
import 'package:tradly/features/authentication/data/datasource/authentication_data_source.dart';
import 'package:tradly/features/authentication/domain/entity/user.dart';
import 'package:tradly/features/authentication/data/model/requests.dart';
import 'package:tradly/features/authentication/domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDataSource _authenticationDataSource;

  AuthenticationRepositoryImpl(this._authenticationDataSource);

  // LOGIN
  @override
  Future<Either<Failure, Authentication>> login(
    LoginRequest loginRequest,
  ) async {
    // Let Dio make the request instead of relying on a connectivity probe.
    // The probe can report no connection while the API is still reachable.
    try {
      final response = await _authenticationDataSource.login(loginRequest);
      if (response.status == ApiInternalStatus.success) {
        return Right(response.toDomain());
      } else {
        return Left(
          Failure(
            ApiInternalStatus.failure,
            response.message ?? ResponseMessage.defaultObject,
          ),
        );
      }
    } catch (error) {
      return left(ErrorHandler.handle(error).failure);
    }
  }

  // REGISTER
  @override
  Future<Either<Failure, Authentication>> register(
    RegisterRequest registerRequest,
  ) async {
    try {
      final response = await _authenticationDataSource.register(
        registerRequest,
      );
      if (response.status == ApiInternalStatus.success) {
        // success
        // return either right
        // return data
        return Right(response.toDomain());
      } else {
        // failure -- return business error
        // return either left
        return Left(
          Failure(
            ApiInternalStatus.failure,
            response.message ?? ResponseMessage.defaultObject,
          ),
        );
      }
    } catch (error) {
      return left(ErrorHandler.handle(error).failure); // اهم line //
    }
  }

  // Reset PASSWORD
  @override
  Future<Either<Failure, ResetPassword>> resetPassword(String email) async {
    try {
      final response = await _authenticationDataSource.resetPassword(email);
      if (response.status == ApiInternalStatus.success) {
        // success
        // return either right
        // return data =>support & contactUs message
        return Right(response.toDomain());
      } else {
        // failure -- return business error
        // return either left
        return Left(
          Failure(
            ApiInternalStatus.failure,
            response.message ?? ResponseMessage.defaultObject,
          ),
        );
      }
    } catch (error) {
      return left(ErrorHandler.handle(error).failure); // اهم line //
    }
  }
}
