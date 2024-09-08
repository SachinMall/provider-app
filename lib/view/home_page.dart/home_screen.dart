import 'package:flutter/cupertino.dart';
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
    double screenWidth = MediaQuery.of(context).size.width;
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
            Container(
              height: 50,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 4,
                  blurStyle: BlurStyle.normal,
                  spreadRadius: 2,
                  offset: Offset(2, 2),
                )
              ]),
              child: CustomInputField(
                borderColor: Colors.white,
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
              ),
            ),
            Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "All featured",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  height: 28,
                  decoration: BoxDecoration(
                    color: AppColors.kwhite,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 0.1,
                        blurStyle: BlurStyle.normal,
                        spreadRadius: 1,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        Text(
                          "Sort",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Gap(5),
                        Icon(CupertinoIcons.arrow_up_arrow_down, size: 15)
                      ],
                    ),
                  ),
                ),
                Gap(15),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  height: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.kwhite,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 0.1,
                        blurStyle: BlurStyle.normal,
                        spreadRadius: 1,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        Text(
                          "filter",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Gap(5),
                        Icon(Icons.filter_alt, size: 15)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Gap(20),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 120,
                width: screenWidth,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.kwhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 56,
                              width: 56,
                              decoration: BoxDecoration(
                                color: AppColors.kred,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Gap(10),
                            Text("Category"),
                          ],
                        ),
                        Gap(15),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}
