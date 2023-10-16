import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class PerfilPresenter {
  Rx<TextEditingController> get contaController;
  Rx<TextEditingController> get cpfController;
  Rx<TextEditingController> get assinaturaController;
  Rx<TextEditingController> get aniversarioController;
  RxBool get isFormValid;

  Future<void> loadSalvarDadosCorretora();

  void validate(String value);
}
