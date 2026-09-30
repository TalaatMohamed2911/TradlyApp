import 'package:dartz/dartz.dart';
import 'package:tradly/features/authentication/domain/entity/user.dart';
import '../../../../core/error/failure.dart';
import '../repository/authentication_repository.dart';
import '../../../../core/usecase/base_usecase.dart';

class ResetPasswordUsecase extends BaseUsecase<String, ResetPassword> {
  final AuthenticationRepository _authenticationRepository;

  ResetPasswordUsecase(this._authenticationRepository);

  @override
  Future<Either<Failure, ResetPassword>> execute(String input) async {
    return await _authenticationRepository.resetPassword(input);
  }
}
