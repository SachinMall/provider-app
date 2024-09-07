import 'package:flutter/material.dart';
import 'package:shopping_app_provider/utils/routes/routes_name.dart';
import 'package:shopping_app_provider/view/onboarding/forgot_password.dart';
import 'package:shopping_app_provider/view/onboarding/login_screen.dart';
import 'package:shopping_app_provider/view/onboarding/carsoule_activity.dart';
import 'package:shopping_app_provider/view/onboarding/signup.dart';
import 'package:shopping_app_provider/view/onboarding/splash.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashActivity());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      case RoutesName.carsouerPage:
        return MaterialPageRoute(
          builder: (BuildContext context) => const CarsouelActivity(),
        );
      case RoutesName.signUp:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SignUpPage(),
        );
      case RoutesName.forgot:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ForgotPassword(),
        );
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No route defined"),
            ),
          );
        });
    }
  }
}
