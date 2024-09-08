import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shopping_app_provider/res/app_colors.dart';
import 'package:shopping_app_provider/res/icons_assets/images.dart';
import 'package:shopping_app_provider/res/screen_size.dart';
import 'package:shopping_app_provider/view/common_widget/custom_textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SvgPicture.asset(
          IconsAssets.splashLogo,
          height: 32,
          width: ScreenSize.width(context) * 0.1,
          fit: BoxFit.cover,
        ),
        actions: [
          Icon(
            Icons.person_2,
            color: AppColors.kred,
          ),
          Gap(10),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CustomInputField(
              onChanged: (p0) {},
              hintText: 'Search any Product..',
              prefixIcon: Icon(Icons.search, color: Color(0xffBBBBBB)),
              isSuffixIcon: Icon(
                Icons.mic,
                color: Color(0xffBBBBBB),
              ),
              validator: (p0) {
                return null;
              },
              textInputType: TextInputType.text,
              fillColor: AppColors.kwhite,
            )
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}
