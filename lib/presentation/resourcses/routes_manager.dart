import 'package:tradly/core/di/di.dart';
import 'package:tradly/features/authentication/presentation/screen/resetPassword_view.dart';
import 'package:tradly/features/authentication/presentation/screen/login_view.dart';
import 'package:tradly/presentation/main/main_view.dart';
import 'package:tradly/presentation/onboarding/view/onboarding_view.dart';
import 'package:tradly/features/authentication/presentation/screen/register_view.dart';
import 'package:tradly/presentation/resourcses/strings_manager.dart';
import 'package:tradly/presentation/splash/splash_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashScreen = "/";
  static const String onBoardingScreen = "/onBoardingScreen";
  static const String loginScreen = "/loginScreen";
  static const String forgotPasswordScreen = "/forgotPasswordScreen";
  static const String registerScreen = "/registerScreen";
  //otp
  static const String homeScreen = "/homeScreen";
  static const String browseScreen = "/browseScreen";
  static const String productDetails = "/productDetails";

  //store
  static const String orderHistoryScreen = "/orderHistoryScreen";
  static const String profileScreen = "/profileScreen";
  //product detail
  static const String wishListScreen = "/wishListScreen";
  static const String checkOutScreen = "/checkOutScreen";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (context) => const OnboardingView());
      case Routes.loginScreen:
        initLoginModule();
        return MaterialPageRoute(builder: (context) => const LoginView());
      case Routes.registerScreen:
        initRegisterModule();
        return MaterialPageRoute(builder: (context) => const RegisterView());
      case Routes.forgotPasswordScreen:
        initResetPasswordModule();
        return MaterialPageRoute(
          builder: (context) => const ResetpasswordView(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => const MainView());

      default:
        return noRouteDefined();
    }
  }

  static Route<dynamic> noRouteDefined() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(title: const Text(AppStrings.noRouteDefined)),
        body: const Center(child: Text(AppStrings.noRouteDefined)),
      ),
    );
  }
}
