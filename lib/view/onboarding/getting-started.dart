import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopping_app_provider/res/app_colors.dart';
import 'package:shopping_app_provider/res/icons_assets/images.dart';
import 'package:shopping_app_provider/res/screen_size.dart';
import 'package:shopping_app_provider/utils/routes/routes_name.dart';
import 'package:shopping_app_provider/view/common_widget/primary_button.dart';

class GettingStartedPage extends StatefulWidget {
  const GettingStartedPage({super.key});

  @override
  State<GettingStartedPage> createState() => _GettingStartedPageState();
}

class _GettingStartedPageState extends State<GettingStartedPage> {
  @override
  Widget build(BuildContext context) {
    // Navigator.pushNamed(context, RoutesName.home);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: Image.asset(
                IconsAssets.gettingStarted,
                fit: BoxFit.contain,
                width: ScreenSize.width(context),
              ),
            ),
            Positioned(
                bottom: 20,
                left: 20,
                right: 0,
                child: Column(
                  children: [
                    Text(
                      "You want\nAuthentic, here\nyou go!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w600,
                          color: AppColors.kwhite),
                    ),
                    Gap(10),
                    Text(
                      "Find it here, buy it now!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.ksecondarywhite),
                    ),
                    Gap(30),
                    SizedBox(
                      width: ScreenSize.width(context) * .8,
                      child: PrimaryButton(
                          onTap: () {
                            Navigator.pushNamed(context, RoutesName.home);
                          },
                          text: "Getting Started"),
                    ),
                    Gap(30),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
