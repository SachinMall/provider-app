import 'package:shopping_app_provider/data/network/base_api_services.dart';
import 'package:shopping_app_provider/data/network/network_api_services.dart';
import 'package:shopping_app_provider/model/product_details_model.dart';
import 'package:shopping_app_provider/model/product_model.dart';
import 'package:shopping_app_provider/res/app_urls.dart';

class ProductRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<List<ProductModel>> getProductsApi() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrls.getProductsUrl);
      return (response as List)
          .map((item) => ProductModel.fromJson(item))
          .toList();
    } catch (e) {
      throw e;
    }
  }

  Future<ProductDetailsModel> getProductsDetailsApi(int productID) async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse('https://fakestoreapi.com/products/$productID');
      return ProductDetailsModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<List<ProductModel>> getProductsListSorting(String sort) async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse('https://fakestoreapi.com/products?sort=$sort');
      return (response as List)
          .map((item) => ProductModel.fromJson(item))
          .toList();
    } catch (e) {
      throw e;
    }
  }
}
