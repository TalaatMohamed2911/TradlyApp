import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tradly/presentation/resourcses/strings_manager.dart';
import '../../resourcses/assets_manager.dart';
import '../../resourcses/colors_manager.dart';
import '../../resourcses/styles_manager.dart';
import '../../resourcses/values_manager.dart';

enum StateRendererType {
  //Popup States
  popupLoadingState,
  popupErrorState,

  //Full Screen States
  fullScreenLoadingState,
  fullScreenErrorState,
  fullScreenEmptyState,

  //Content State
  contentState,

  // Success State
  successState,
}

class StateRenderer extends StatelessWidget {
  final StateRendererType stateRendererType;
  final String title;
  final String message;
  final Function retryActionFunction;

  const StateRenderer({
    super.key,
    required this.stateRendererType,
    this.title = "",
    this.message = AppStrings.loading,
    required this.retryActionFunction,
  });

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.popupLoadingState:
        return _getPopupDialogWidget([
          _getAnimatedImage(JsonAssets.loading),
        ]); // Replace with your loading widget
      case StateRendererType.popupErrorState:
        return _getPopupDialogWidget([
          _getAnimatedImage(JsonAssets.error),
          _getMessage(message),
          _getRetryButton(AppStrings.ok, context),
        ]); // Replace with your error widget
      case StateRendererType.fullScreenLoadingState:
        return _getColumnItems([
          _getAnimatedImage(JsonAssets.loading),
          _getMessage(message),
        ]); // Replace with your loading widget
      case StateRendererType.fullScreenErrorState:
        return _getColumnItems([
          _getAnimatedImage(JsonAssets.error),
          _getMessage(message),
          _getRetryButton(AppStrings.retry, context),
        ]); // Replace with your error widget
      case StateRendererType.fullScreenEmptyState:
        return _getColumnItems([
          _getAnimatedImage(JsonAssets.empty),
          _getMessage(AppStrings.noData),
        ]); // Replace with your error// Replace with your empty state widget
      case StateRendererType.contentState:
        return Container(); // Replace with your content widget
      case StateRendererType.successState:
        return _getPopupDialogWidget([
          _getAnimatedImage(JsonAssets.success),
          _getMessage(message),
          _getRetryButton(AppStrings.ok, context),
        ]);
    }
  }

  Widget _getPopupDialogWidget(List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s14),
      ),
      backgroundColor: Colors.transparent,
      elevation: AppSize.s4,
      shadowColor: Colors.black26,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s14),
          color: ColorManager.white,
          shape: BoxShape.rectangle,
          boxShadow: [BoxShadow(color: Colors.black26)],
        ),
        child: _getDialogContent(children),
      ),
    );
  }

  Widget _getDialogContent(List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(String jsonPath) {
    return SizedBox(
      width: AppSize.s100,
      height: AppSize.s100,
      child: Lottie.asset(jsonPath),
    );
  }

  Widget _getMessage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p12),
        child: Text(
          message,
          style: getRegularStyle(
            color: ColorManager.black,
            fontsize: AppSize.s14,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _getRetryButton(String title, BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p12),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              if (stateRendererType == StateRendererType.fullScreenErrorState) {
                retryActionFunction.call();
              } else {
                Navigator.of(context).pop();
              }
            },
            child: Text(title),
          ),
        ),
      ),
    );
  }

  Widget _getColumnItems(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}
