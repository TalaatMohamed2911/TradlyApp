import 'dart:async';

import 'package:tradly/core/utils/functions.dart';
import 'package:tradly/features/authentication/domain/usecase/reset_password_usecase.dart';
import 'package:tradly/presentation/base/baseviewmodel.dart';

class ResetPasswordViewModel extends BaseViewModel
    with ForgotPasswordViewModelInputs, ForgotPasswordViewModelOutputs {
  final _emailStreamController = StreamController<String>.broadcast();
  final StreamController _isInputValidStreamController =
      StreamController<void>.broadcast();

  var email = "";

  final ResetPasswordUsecase _forgotPasswordUsecase;
  ResetPasswordViewModel(this._forgotPasswordUsecase);

  @override
  void dispose() {
    // super.dispose();
    _emailStreamController.close();
    _isInputValidStreamController.close();
  }

  @override
  void start() {
    // inputState.add(ContentState());
  }

  @override
  void resetPassword() async {
    // inputState.add(
    //   LoadingState(stateRendererType: StateRendererType.popupLoadingState),
    // );
    (await _forgotPasswordUsecase.execute(email)).fold(
      (failure) {
        // inputState.add(
        //   ErrorState(
        //     stateRendererType: StateRendererType.popupErrorState,
        //     message: failure.message,
        //   ),
        // );
      },
      (supportMessage) {
        // Handle success
        // inputState.add(SuccessState(supportMessage.support));
      },
    );
  }

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputIsInputValid => _isInputValidStreamController.sink;

  @override
  Stream<bool> get outIsEmailValid =>
      _emailStreamController.stream.map((email) => isEmailValidChecker(email));

  @override
  Stream<bool> get outIsInputValid =>
      _isInputValidStreamController.stream.map((_) => _isUserEnteredData());

  @override
  void setEmail(String email) {
    inputEmail.add(email);
    this.email = email;
    inputIsInputValid.add(null);
  }

  bool _isUserEnteredData() {
    return isEmailValidChecker(email);
  }
}

abstract mixin class ForgotPasswordViewModelInputs {
  void setEmail(String email);
  void resetPassword();
  Sink get inputEmail;
  Sink get inputIsInputValid;
}

abstract mixin class ForgotPasswordViewModelOutputs {
  Stream<bool> get outIsEmailValid;
  Stream<bool> get outIsInputValid;
}
