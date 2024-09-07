import 'package:shopping_app_provider/data/network/base_api_services.dart';
import 'package:shopping_app_provider/data/network/network_api_services.dart';
import 'package:shopping_app_provider/res/app_urls.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic payload) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(payload, AppUrls.loginUrl);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic payload) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(payload, AppUrls.registerUrl);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
