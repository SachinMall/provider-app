import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopping_app_provider/res/app_colors.dart';
import 'package:shopping_app_provider/view/common_widget/custom_textfield.dart';
import 'package:shopping_app_provider/view/common_widget/primary_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kwhite,
      appBar: AppBar(
        backgroundColor: AppColors.kwhite,
        shadowColor: AppColors.kwhite,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Forgot\npassword?",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
              ),
              Gap(30),
              CustomInputField(
                onChanged: (p0) {},
                fillColor: AppColors.textFieldColor,
                prefixIcon:
                    Icon(Icons.lock, size: 24, color: AppColors.darkGrey),
                textInputType: TextInputType.emailAddress,
                labelText: "Enter your email address",
                validator: (p0) {
                  return null;
                },
              ),
              Gap(20),
              Text(
                "* We will send you a message to set or reset your new password",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.txtSecondary),
              ),
              Gap(25),
              PrimaryButton(onTap: () {}, text: "Submit")
            ],
          ),
        ),
      ),
    );
  }
}
