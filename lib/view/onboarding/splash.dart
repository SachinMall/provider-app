import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_app_provider/res/icons_assets/images.dart';
import 'package:shopping_app_provider/utils/routes/routes_name.dart';

class SplashActivity extends StatefulWidget {
  const SplashActivity({super.key});

  @override
  State<SplashActivity> createState() => _SplashActivityState();
}

class _SplashActivityState extends State<SplashActivity> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, RoutesName.login);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(IconsAssets.splashLogo),
      ),
    );
  }
}
