import 'dart:async';

import 'package:tradly/core/utils/functions.dart';
import 'package:tradly/features/authentication/domain/usecase/login_usecase.dart';
import 'package:tradly/presentation/base/baseviewmodel.dart';
import 'package:tradly/presentation/common/freezed_data_classes.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  final _emailStreamController = StreamController<String>.broadcast();
  final _passwordStreamController = StreamController<String>.broadcast();

  final _areAllInputsValidStreamController = StreamController<void>.broadcast();

  final isUserLoggedInSuccessfullyStreamController = StreamController<bool>();

  var loginObject = LoginObject("", "");

  final LoginUsecase _loginUsecase;
  LoginViewModel(this._loginUsecase);

  @override
  void dispose() {
    // super.dispose();
    _emailStreamController.close();
    _passwordStreamController.close();
    _areAllInputsValidStreamController.close();
    isUserLoggedInSuccessfullyStreamController.close();
  }

  @override
  void start() {
    // inputState.add(ContentState());
  }

  @override
  Sink get emailInput => _emailStreamController.sink;

  @override
  Sink get passwordInput => _passwordStreamController.sink;

  @override
  Sink get inputAreAllInputsValid => _areAllInputsValidStreamController.sink;

  @override
  setEmail(String email) {
    emailInput.add(email);
    if (isEmailValidChecker(email)) {
      loginObject = loginObject.copyWith(email: email);
    } else {
      loginObject = loginObject.copyWith(email: "");
    }
    inputAreAllInputsValid.add(null);
  }

  @override
  setPassoword(String password) {
    passwordInput.add(password);
    if (_isPasswordValid(password)) {
      loginObject = loginObject.copyWith(password: password);
    } else {
      loginObject = loginObject.copyWith(password: "");
    }
    inputAreAllInputsValid.add(null);
  }

  bool _isPasswordValid(String password) {
    return password.length >= 6;
  }

  @override
  login() async {
    // inputState.add(
    //   LoadingState(stateRendererType: StateRendererType.popupLoadingState),
    // );
    (await _loginUsecase.execute(
      LoginUsecaseInput(loginObject.email, loginObject.password),
    )).fold(
      (failure) {
        //   return inputState.add(
        //   ErrorState(
        //     stateRendererType: StateRendererType.popupErrorState,
        //     message: failure.message,
        //   ),
        // );
      },
      (success) {
        // inputState.add(ContentState());
        isUserLoggedInSuccessfullyStreamController.add(true);
      },
    );
  }

  @override
  Stream<bool> get outputIsEmailValid =>
      _emailStreamController.stream.map((email) => isEmailValidChecker(email));

  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputAreAllInputsValid => _areAllInputsValidStreamController
      .stream
      .map((_) => _areAllInputsValid());

  bool _areAllInputsValid() {
    return isEmailValidChecker(loginObject.email) &&
        _isPasswordValid(loginObject.password);
  }
}

abstract mixin class LoginViewModelInputs {
  void setEmail(String email);
  void setPassoword(String password);
  void login();

  Sink get emailInput;
  Sink get passwordInput;
  Sink get inputAreAllInputsValid;
}

abstract mixin class LoginViewModelOutputs {
  Stream<bool> get outputIsEmailValid;

  Stream<bool> get outputIsPasswordValid;

  Stream<bool> get outputAreAllInputsValid;
}
