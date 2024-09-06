import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider_mvvm/res/colors/app_colors.dart';
import 'package:provider_mvvm/view/onboarding/common_widget/custom_textfield.dart';

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
            
          ],
        ),
      ),
    ));
  }
}
