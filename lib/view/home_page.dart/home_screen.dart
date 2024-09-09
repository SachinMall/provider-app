import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_provider/res/app_colors.dart';
import 'package:shopping_app_provider/res/icons_assets/images.dart';
import 'package:shopping_app_provider/res/screen_size.dart';
import 'package:shopping_app_provider/utils/routes/routes_name.dart';
import 'package:shopping_app_provider/view/common_widget/custom_textfield.dart';
import 'package:shopping_app_provider/view_model/product_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductViewModel>(context, listen: false)
          .getProductsListApi();
    });
    super.initState();
  }

  int _sortDirection = 1;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: AppColors.kwhite,
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          // color: AppColors.kwhite,
                          width: screenWidth,
                          padding: EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              RadioListTile<int>(
                                value: 1,
                                groupValue: _sortDirection,
                                onChanged: (value) {
                                  setState(() {
                                    _sortDirection = value!;
                                    Provider.of<ProductViewModel>(context,
                                            listen: false)
                                        .getProductsSortedListApi('asc');
                                  });
                                  Navigator.pop(context);
                                },
                                title: Text('Sort by Ascending'),
                              ),
                              RadioListTile<int>(
                                value: 2,
                                groupValue: _sortDirection,
                                onChanged: (value) {
                                  setState(() {
                                    _sortDirection = value!;
                                    Provider.of<ProductViewModel>(context,
                                            listen: false)
                                        .getProductsSortedListApi('desc');
                                  });
                                  Navigator.pop(context);
                                },
                                title: Text('Sort by Descending'),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
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
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Container(
            //     height: 120,
            //     width: screenWidth,
            //     padding: EdgeInsets.all(8),
            //     decoration: BoxDecoration(
            //       color: AppColors.kwhite,
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     child: ListView.builder(
            //       shrinkWrap: true,
            //       itemCount: 4,
            //       scrollDirection: Axis.horizontal,
            //       physics: BouncingScrollPhysics(),
            //       itemBuilder: (context, index) {
            //         return Row(
            //           children: [
            //             Column(
            //               children: [
            //                 Container(
            //                   height: 56,
            //                   width: 56,
            //                   decoration: BoxDecoration(
            //                     color: AppColors.kred,
            //                     shape: BoxShape.circle,
            //                   ),
            //                 ),
            //                 Gap(10),
            //                 Text("Category"),
            //               ],
            //             ),
            //             Gap(15),
            //           ],
            //         );
            //       },
            //     ),
            //   ),
            // ),
            Consumer<ProductViewModel>(
              builder: (context, productViewModel, child) {
                if (productViewModel.isProductListloading) {
                  return Center(child: CircularProgressIndicator());
                } else if (productViewModel.error.isNotEmpty) {
                  return Center(child: Text(productViewModel.error));
                } else if (productViewModel.productList.isEmpty) {
                  return Center(child: Text('No products available'));
                } else {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: productViewModel.productList.length,
                    itemBuilder: (context, index) {
                      final product = productViewModel.productList[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RoutesName.productDetails,
                              arguments: product.id);
                        },
                        child: Card(
                          color: AppColors.kwhite,
                          shadowColor: AppColors.kred,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Image.network(
                                  product.image,
                                  fit: BoxFit.contain,
                                  width: screenWidth,
                                  height: screenHeight,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      '\$${product.price.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}
