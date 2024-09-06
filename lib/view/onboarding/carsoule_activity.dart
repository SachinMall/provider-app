import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider_mvvm/res/icons_assets/images.dart';
import 'package:provider_mvvm/view/onboarding/common_widget/carsoule_widget.dart';

class CarsouelActivity extends StatefulWidget {
  const CarsouelActivity({super.key});

  @override
  State<CarsouelActivity> createState() => _CarsouelActivityState();
}

class _CarsouelActivityState extends State<CarsouelActivity> {
  var itemsList = [
    {
      "svg_path": IconsAssets.carsouer1,
      "title": "Choose Products",
      "description":
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
    },
    {
      "svg_path": IconsAssets.carsouer2,
      "title": "Make Payment",
      "description":
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
    },
    {
      "svg_path": IconsAssets.carsouer3,
      "title": "Get Your Order",
      "description":
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
    }
  ];
  int _currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CarsouleWidget(
          itemsList: itemsList,
          currentSlide: _currentSlide,
          onPageChanged: (index, _) {
            setState(() {
              _currentSlide = index;
            });
          },
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: screenWidth,
              margin: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.07,
                  horizontal: screenWidth * 0.25),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Hero(
                tag: "logo",
                child: SvgPicture.asset(IconsAssets.splashLogo,
                    fit: BoxFit.contain, height: 30),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          child: Column(
            children: [
              DotsIndicator(
                dotsCount: itemsList.length,
                position: _currentSlide,
                decorator: DotsDecorator(
                  activeSize: const Size(26.0, 9),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  color: Colors.black,
                  activeColor: Colors.red,
                ),
              ),
              Gap(20),
              // SizedBox(
              //   width:screenWidth,
              //   child: Padding(
              //     padding:
              //         const EdgeInsets.only(left: 16, right: 16, bottom: 18),
              //     child: PrimaryButton(
              //       onTap: () {
              //         userPreference.isFirstOpen(true).then((value) {
              //           Get.to(() => const SignIn());
              //         }).onError((error, stackTrace) {
              //           const ErrorPopup(
              //             errorMsg:
              //                 'Something went wrong,please try after sometime',
              //             errorTitle: 'Error',
              //           );
              //           if (kDebugMode) {
              //             print('isFirstOpen:  $error \n $stackTrace');
              //           }
              //         });
              //       },
              //       title: 'Get started',
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
