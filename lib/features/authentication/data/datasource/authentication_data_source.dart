import 'package:tradly/core/network/app_api.dart';
import 'package:tradly/features/authentication/data/model/requests.dart';

import 'package:tradly/features/authentication/data/model/responses.dart';

abstract class AuthenticationDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);

  Future<ResetPasswordResponse> resetPassword(String email);

  Future<AuthenticationResponse> register(RegisterRequest registerRequest);
}

class AuthenticationDataSourceImpl implements AuthenticationDataSource {
  final AppServiceClient _appServiceClient;

  AuthenticationDataSourceImpl(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
      loginRequest.email,
      loginRequest.password,
    );
  }

  @override
  Future<ResetPasswordResponse> resetPassword(String email) async {
    return await _appServiceClient.resetPassword(email);
  }

  @override
  Future<AuthenticationResponse> register(
    RegisterRequest registerRequest,
  ) async {
    return await _appServiceClient.register(
      registerRequest.firstName,
      registerRequest.lastName,
      registerRequest.email,
      registerRequest.password,
    );
  }
}
