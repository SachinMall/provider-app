import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_provider/view_model/product_view_model.dart';

class ProductDescription extends StatefulWidget {
  final int productID;
  const ProductDescription({super.key, required this.productID});

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Provider.of<ProductViewModel>(context, listen: false)
            .getProductsDetailsApi(widget.productID);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Product Details"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Consumer<ProductViewModel>(
          builder: (context, productViewModel, child) {
            if (productViewModel.isProductDetailsloading) {
              return Center(child: CircularProgressIndicator());
            } else if (productViewModel.productDetailsError.isNotEmpty) {
              return Center(child: Text(productViewModel.productDetailsError));
            } else
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    productViewModel.productDetails.image,
                    fit: BoxFit.contain,
                    height: 300,
                  ),
                  Divider(),
                  Text(
                    "Category:- ${productViewModel.productDetails.category}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Gap(15),
                  Text(
                    "Title:- ${productViewModel.productDetails.title}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Gap(10),
                  Text(
                    "Des:- ${productViewModel.productDetails.description}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Gap(10),
                ],
              );
          },
        ),
      ),
    );
  }
}
