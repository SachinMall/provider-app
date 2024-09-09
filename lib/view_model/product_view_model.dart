import 'package:flutter/foundation.dart';
import 'package:shopping_app_provider/model/product_details_model.dart';
import 'package:shopping_app_provider/model/product_model.dart';
import 'package:shopping_app_provider/repository/prdouct_repository.dart';

class ProductViewModel with ChangeNotifier {
  final _myRepo = ProductRepository();
  bool isProductListloading = false;
  List<ProductModel> productList = [];
  ProductDetailsModel productDetails =
      ProductDetailsModel(rating: ProductRating());
  bool isProductDetailsloading = false;
  String error = '';
  String productDetailsError = '';

  Future<void> getProductsListApi() async {
    isProductListloading = true;
    error = '';
    notifyListeners();

    try {
      productList = await _myRepo.getProductsApi();
      isProductListloading = false;
    } catch (e) {
      error = e.toString();
      isProductListloading = false;
    }
    notifyListeners();
  }

  Future<void> getProductsDetailsApi(int id) async {
    isProductDetailsloading = true;
    productDetailsError = '';
    notifyListeners();
    try {
      productDetails = await _myRepo.getProductsDetailsApi(id);
      isProductDetailsloading = false;
    } catch (e) {
      productDetailsError = e.toString();
      isProductDetailsloading = false;
    }
    notifyListeners();
  }

  Future<void> getProductsSortedListApi(String sort) async {
    isProductListloading = true;
    error = '';
    notifyListeners();

    try {
      productList = await _myRepo.getProductsListSorting(sort);
      isProductListloading = false;
    } catch (e) {
      error = e.toString();
      isProductListloading = false;
    }
    notifyListeners();
  }
}
