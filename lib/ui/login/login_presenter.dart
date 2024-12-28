import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginPresenter {
  Rx<TextEditingController> get emailController;
  Rx<TextEditingController> get senhaController;
  RxBool get isValid;
  RxBool get isLoading;
  void validate(String value);
  Future<void> loadLogin();
}
