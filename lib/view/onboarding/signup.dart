import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm/res/app_colors.dart';
import 'package:provider_mvvm/res/icons_assets/images.dart';
import 'package:provider_mvvm/view/common_widget/custom_textfield.dart';
import 'package:provider_mvvm/view/common_widget/primary_button.dart';
import 'package:provider_mvvm/view/onboarding/login_screen.dart';
import 'package:provider_mvvm/view_model/auth_view_model.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  // TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      backgroundColor: AppColors.kwhite,
      appBar: AppBar(
        backgroundColor: AppColors.kwhite,
        shadowColor: AppColors.kwhite,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create an\naccount',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
            ),
            Gap(30),
            CustomInputField(
              onChanged: (p0) {},
              textController: _emailController,
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
              textController: _passwordController,
              fillColor: AppColors.textFieldColor,
              prefixIcon: Icon(Icons.lock, size: 24, color: AppColors.darkGrey),
              textInputType: TextInputType.visiblePassword,
              labelText: "Password",
              validator: (p0) {
                return null;
              },
            ),
            Gap(30),
            CustomInputField(
              onChanged: (p0) {},
              // textController: _confirmPasswordController,
              fillColor: AppColors.textFieldColor,
              prefixIcon: Icon(Icons.person_2_sharp,
                  size: 24, color: AppColors.darkGrey),
              textInputType: TextInputType.none,
              labelText: "Confirm Password",
              validator: (p0) {
                return null;
              },
            ),
            Gap(25),
            RichText(
              text: TextSpan(
                text: "By clicking the",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.txtSecondary),
                children: [
                  TextSpan(
                    text: " Register",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.kred),
                  ),
                  TextSpan(
                    text: ' button, you agree to the public offer',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.txtSecondary),
                  ),
                ],
              ),
            ),
            Gap(30),
            PrimaryButton(
                onTap: () {
                  Map data = {
                    'email': _emailController.text.toString(),
                    'password': _passwordController.text.toString(),
                  };
                  authViewModel.registerApi(data, context);
                },
                text: "Create Account"),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SignupContainer(
                  image: IconsAssets.googleLogo,
                  onTap: () {},
                ),
                Gap(10),
                SignupContainer(
                  image: IconsAssets.appleLogo,
                  onTap: () {},
                ),
                Gap(10),
                SignupContainer(
                  image: IconsAssets.fbLogo,
                  onTap: () {},
                ),
              ],
            ),
            Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "I Already Have an Account",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.txtPrimary),
                ),
                Gap(5),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.kred),
                  ),
                ),
              ],
            ),
            Gap(25),
          ],
        ),
      ),
    );
  }
}
