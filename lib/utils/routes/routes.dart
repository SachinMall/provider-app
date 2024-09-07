import 'package:flutter/material.dart';
import 'package:provider_mvvm/utils/routes/routes_name.dart';
import 'package:provider_mvvm/view/onboarding/forgot_password.dart';
import 'package:provider_mvvm/view/onboarding/login_screen.dart';
import 'package:provider_mvvm/view/onboarding/carsoule_activity.dart';
import 'package:provider_mvvm/view/onboarding/signup.dart';
import 'package:provider_mvvm/view/onboarding/splash.dart';

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


//slide transition between the pages


// class Routes {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case RoutesName.splash:
//         return _createRoute(const SplashActivity());
//       case RoutesName.login:
//         return _createRoute(const LoginScreen());
//       case RoutesName.carsouerPage:
//         return _createRoute(const CarsouelActivity());
//       case RoutesName.signUp:
//         return _createRoute(const SignUpPage());
//       case RoutesName.forgot:
//         return _createRoute(const ForgotPassword());
//       default:
//         return MaterialPageRoute(builder: (_) {
//           return const Scaffold(
//             body: Center(
//               child: Text("No route defined"),
//             ),
//           );
//         });
//     }
//   }

//   // Helper function to create routes with custom transitions
//   static Route _createRoute(Widget page) {
//     return PageRouteBuilder(
//       pageBuilder: (context, animation, secondaryAnimation) => page,
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         // Define the transition: Slide from the bottom
//         const begin = Offset(0.0, 1.0);
//         const end = Offset.zero;
//         const curve = Curves.ease;

//         var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//         var offsetAnimation = animation.drive(tween);

//         return SlideTransition(
//           position: offsetAnimation,
//           child: child,
//         );
//       },
//     );
//   }
// }