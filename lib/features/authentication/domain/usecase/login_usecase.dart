import 'package:dartz/dartz.dart';
import 'package:tradly/core/error/failure.dart';
import 'package:tradly/features/authentication/data/model/requests.dart';
import 'package:tradly/features/authentication/domain/entity/user.dart';
import 'package:tradly/features/authentication/domain/repository/authentication_repository.dart';
import 'package:tradly/core/usecase/base_usecase.dart';

class LoginUsecase implements BaseUsecase<LoginUsecaseInput, Authentication> {
  final AuthenticationRepository _authenticationRepository;

  LoginUsecase(this._authenticationRepository);

  @override
  Future<Either<Failure, Authentication>> execute(
    LoginUsecaseInput input,
  ) async {
    return await _authenticationRepository.login(
      LoginRequest(input.email, input.password),
    );
  }
}

class LoginUsecaseInput {
  String email;
  String password;

  LoginUsecaseInput(this.email, this.password);
}
