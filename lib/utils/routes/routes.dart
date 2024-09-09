import 'package:flutter/material.dart';
import 'package:shopping_app_provider/utils/routes/routes_name.dart';
import 'package:shopping_app_provider/view/home_page.dart/home_screen.dart';
import 'package:shopping_app_provider/view/home_page.dart/product_desc.dart';
import 'package:shopping_app_provider/view/onboarding/forgot_password.dart';
import 'package:shopping_app_provider/view/onboarding/getting-started.dart';
import 'package:shopping_app_provider/view/onboarding/login_screen.dart';
import 'package:shopping_app_provider/view/onboarding/carsoule_activity.dart';
import 'package:shopping_app_provider/view/onboarding/signup.dart';
import 'package:shopping_app_provider/view/onboarding/splash.dart';
import 'package:shopping_app_provider/view/root/root_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashActivity());
     case RoutesName.rootpage:
  final int pageIndex = settings.arguments != null ? settings.arguments as int : 0;
  return MaterialPageRoute(
    builder: (BuildContext context) => RootPage(selectedIndex: pageIndex),
  );

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
      case RoutesName.gettingStarted:
        return MaterialPageRoute(
          builder: (BuildContext context) => const GettingStartedPage(),
        );
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen(),
        );
      case RoutesName.productDetails:
        final int productID = settings.arguments as int;
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              ProductDescription(productID: productID),
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