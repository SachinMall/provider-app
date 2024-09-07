import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopping_app_provider/res/app_colors.dart';
import 'package:shopping_app_provider/res/icons_assets/images.dart';
import 'package:shopping_app_provider/utils/routes/routes_name.dart';
import 'package:shopping_app_provider/utils/utils.dart';
import 'package:shopping_app_provider/view_model/auth_view_model.dart';
import 'package:shopping_app_provider/view/common_widget/custom_textfield.dart';
import 'package:shopping_app_provider/view/common_widget/primary_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
        backgroundColor: AppColors.kwhite,
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
                  textController: _emailController,
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
                ValueListenableBuilder(
                  valueListenable: _obsecurePassword,
                  builder: (context, value, child) {
                    return CustomInputField(
                      textController: _passwordController,
                      obscureText: _obsecurePassword.value,
                      isSuffixIcon: InkWell(
                          onTap: () {
                            _obsecurePassword.value = !_obsecurePassword.value;
                          },
                          child: Icon(_obsecurePassword.value
                              ? Icons.visibility_off_rounded
                              : Icons.visibility)),
                      onChanged: (p0) {},
                      fillColor: AppColors.textFieldColor,
                      prefixIcon:
                          Icon(Icons.lock, size: 24, color: AppColors.darkGrey),
                      textInputType: TextInputType.visiblePassword,
                      labelText: "Password",
                      validator: (p0) {
                        return null;
                      },
                    );
                  },
                ),
                Gap(5),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesName.forgot);
                    },
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
                  isLoading: authViewModel.isLoginLoading,
                  onTap: () {
                    Map data = {
                      'email': _emailController.text.toString(),
                      'password': _passwordController.text.toString(),
                    };
                    if (_emailController.text.isEmpty) {
                      Utils.toastMessage("Email is Required");
                    } else if (_passwordController.text.isEmpty) {
                      Utils.toastMessage("Password is Empty");
                    } else {
                      authViewModel.loginApi(data, context);
                    }
                  },
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
                      "Create An Account",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.txtPrimary),
                    ),
                    Gap(5),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesName.signUp);
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: AppColors.kred),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

class SignupContainer extends StatelessWidget {
  final String image;
  final void Function() onTap;
  const SignupContainer({
    super.key,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54,
        width: 54,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.kred),
            color: AppColors.signUpContainerColor,
            shape: BoxShape.circle),
        child: Center(
          child: Image.asset(
            image,
            height: 24,
            width: 24,
          ),
        ),
      ),
    );
  }
}
