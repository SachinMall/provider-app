import 'package:flutter/material.dart';
import 'package:provider_mvvm/res/colors/app_colors.dart';
import 'package:provider_mvvm/res/scree_size/screen_size.dart';

class PrimaryButton extends StatelessWidget {
  final void Function() onTap;
  final String text;
  const PrimaryButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenSize.width(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: screenWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: AppColors.kred),
        child: Center(
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
