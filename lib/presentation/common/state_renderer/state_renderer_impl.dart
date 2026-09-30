import 'package:flutter/material.dart';
import 'package:tradly/presentation/resourcses/strings_manager.dart';
import '../../../core/utils/constants.dart';
import 'state_renderer.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();
  String getMessage();
}

class LoadingState extends FlowState {
  StateRendererType stateRendererType;
  String? message;
  LoadingState({required this.stateRendererType, this.message});

  @override
  String getMessage() => message ?? AppStrings.loading;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

class ErrorState extends FlowState {
  StateRendererType stateRendererType;
  String message;
  ErrorState({required this.stateRendererType, required this.message});

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

class ContentState extends FlowState {
  ContentState();

  @override
  String getMessage() => AppConstants.empty;

  @override
  StateRendererType getStateRendererType() => StateRendererType.contentState;
}

class EmptyState extends FlowState {
  String message;
  EmptyState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.fullScreenEmptyState;
}

class SuccessState extends FlowState {
  String message;
  SuccessState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => StateRendererType.successState;
}

extension FlowStateExtension on FlowState {
  Widget getScreenWidget(
    BuildContext context,
    Widget contentScreenWidget,
    Function retryActionFunction,
  ) {
    switch (runtimeType) {
      case const (LoadingState):
        {
          if (getStateRendererType() == StateRendererType.popupLoadingState) {
            // show popup loading dialog
            showPopUp(context, getStateRendererType(), getMessage());
            // show content ui of the screen
            return contentScreenWidget;
          } else {
            // full screen loading
            return StateRenderer(
              stateRendererType: getStateRendererType(),
              message: getMessage(),
              retryActionFunction: () {},
            );
          }
        }
      case const (ErrorState):
        {
          dismissDialog(context);
          if (getStateRendererType() == StateRendererType.popupErrorState) {
            showPopUp(context, getStateRendererType(), getMessage());
            return contentScreenWidget;
          } else {
            return StateRenderer(
              stateRendererType: getStateRendererType(),
              message: getMessage(),
              retryActionFunction: retryActionFunction,
            );
          }
        }
      case const (EmptyState):
        {
          return StateRenderer(
            stateRendererType: getStateRendererType(),
            message: getMessage(),
            retryActionFunction: () {},
          );
        }
      case const (ContentState):
        {
          dismissDialog(context);
          return contentScreenWidget;
        }
      case const (SuccessState):
        {
          dismissDialog(context);
          showPopUp(context, getStateRendererType(), getMessage());
          return contentScreenWidget;
        }
      default:
        {
          dismissDialog(context);
          return contentScreenWidget;
        }
    }
  }

  // Check if the current dialog is showing
  // هل فيه dialog معروض دلوقتي ولا لأ
  bool _isCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  void dismissDialog(BuildContext context) {
    if (_isCurrentDialogShowing(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  void showPopUp(
    BuildContext context,
    StateRendererType stateRendererType,
    String message,
  ) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => StateRenderer(
          stateRendererType: stateRendererType,
          message: message,
          retryActionFunction: () {},
        ),
      );
    });
  }
}
