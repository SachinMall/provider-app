import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shopping_app_provider/res/app_colors.dart';
import 'package:shopping_app_provider/res/screen_size.dart';

class PrimaryButton extends StatelessWidget {
  final void Function() onTap;
  final String text;
  final bool isLoading;
  const PrimaryButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenSize.width(context);
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        height: 55,
        width: screenWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: AppColors.kred),
        child: isLoading
            ? const Center(
                child: SizedBox(
                  height: 38,
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballPulse,
                    colors: [AppColors.kwhite],
                    strokeWidth: 4,
                  ),
                ),
              )
            : Center(
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.kwhite),
                ),
              ),
      ),
    );
  }
}
