import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider_mvvm/repository/auth_repository.dart';
import 'package:provider_mvvm/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async {
    try {
      var value = await _myRepo.loginApi(data);
      log(value.toString());
    } catch (error, stackTrace) {
      log('Login Error: $error');
      log('Stack Trace: $stackTrace');
      Utils.flutterErrorMessage(error.toString(), context);
    }
  }
}
