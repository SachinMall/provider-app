import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shopping_app_provider/repository/auth_repository.dart';
import 'package:shopping_app_provider/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool isLoginLoading = false;
  Future<void> loginApi(dynamic data, BuildContext context) async {
    isLoginLoading = true;
    try {
      var value = await _myRepo.loginApi(data);
      log(value.toString());
      isLoginLoading = false;
    } catch (error, stackTrace) {
      isLoginLoading = false;
      log('Login Error: $error');
      log('Stack Trace: $stackTrace');
      Utils.snackBar(error.toString(), context);
    }
  }

  Future<void> registerApi(dynamic data, BuildContext context) async {
    try {
      var value = await _myRepo.registerApi(data);
      log(value.toString());
    } catch (error, stackTrace) {
      log('Register Error: $error');
      log('Stack Trace: $stackTrace');
      Utils.snackBar(error.toString(), context);
    }
  }
}
