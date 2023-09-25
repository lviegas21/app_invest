import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginPresenter {
  Rx<TextEditingController> get cpfController;
  Rx<TextEditingController> get senhaController;
  RxBool get isValid;
  void validate(String value);
  Future<void> loadLogin();
}
