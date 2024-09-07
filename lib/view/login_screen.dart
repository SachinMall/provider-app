import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider_mvvm/res/colors/app_colors.dart';
import 'package:provider_mvvm/res/icons_assets/images.dart';
import 'package:provider_mvvm/view/common_widget/custom_textfield.dart';
import 'package:provider_mvvm/view/common_widget/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome\nBack!",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
            ),
            Gap(30),
            CustomInputField(
              onChanged: (p0) {},
              fillColor: AppColors.textFieldColor,
              prefixIcon: Icon(Icons.person_2_sharp,
                  size: 24, color: AppColors.darkGrey),
              textInputType: TextInputType.none,
              labelText: "Username or email",
              validator: (p0) {
                return null;
              },
            ),
            Gap(25),
            CustomInputField(
              onChanged: (p0) {},
              fillColor: AppColors.textFieldColor,
              prefixIcon: Icon(Icons.lock, size: 24, color: AppColors.darkGrey),
              textInputType: TextInputType.visiblePassword,
              labelText: "Password",
              validator: (p0) {
                return null;
              },
            ),
            Gap(5),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.kred),
                ),
              ),
            ),
            Gap(40),
            PrimaryButton(
              onTap: () {},
              text: "Login",
            ),
            Gap(50),
            Align(
              alignment: Alignment.center,
              child: Text(
                "- OR Continue with -",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.txtPrimary),
              ),
            ),
            Gap(20),
            Container(
              height: 54,
              width: 54,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.kred),
                  color: AppColors.signUpContainerColor,
                  shape: BoxShape.circle),
              child: Center(
                child: SvgPicture.asset(IconsAssets.googleLogo),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
