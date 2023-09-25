import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CadastroPresenter {
  Rx<TextEditingController> get emailController;
  Rx<TextEditingController> get senhaController;
  Rx<TextEditingController> get nomeController;
  void validate(String value);
  Future<void> loadCadastro();

  RxBool get isValid;
}
