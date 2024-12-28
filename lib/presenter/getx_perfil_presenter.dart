import 'dart:ffi';

import 'package:bolsa_valores/domain/usecase/query_inserindo_corretora.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:get/get.dart';

import '../ui/perfil/perfil_presenter.dart';

class GetxPerfilPresenter extends GetxController implements PerfilPresenter {
  final QueryInserindoCorretora queryInserindoCorretora;

  GetxPerfilPresenter({required this.queryInserindoCorretora});
  @override
  void onInit() {
    super.onInit();
  }

  dynamic uid = Get.arguments;

  @override
  Rx<TextEditingController> aniversarioController = TextEditingController().obs;

  @override
  Rx<TextEditingController> assinaturaController = TextEditingController().obs;

  @override
  Rx<TextEditingController> contaController = TextEditingController().obs;

  @override
  Rx<TextEditingController> cpfController = TextEditingController().obs;

  @override
  void validate(String value) =>
      isFormValid.value = contaController.value.text.isNotEmpty &&
          cpfController.value.text.isNotEmpty &&
          cpfController.value.text.length == 14 &&
          aniversarioController.value.text.isNotEmpty &&
          aniversarioController.value.text.length == 10 &&
          assinaturaController.value.text.isNotEmpty;

  @override
  Future<void> loadSalvarDadosCorretora() async {
    try {
      final response = queryInserindoCorretora.loadDataCorretoraUser(
          uid,
          contaController.value.text,
          cpfController.value.text,
          aniversarioController.value.text,
          assinaturaController.value.text);
      Get.defaultDialog(
        backgroundColor: Colors
            .transparent, // Removemos a cor de fundo para personalizar o diálogo
        contentPadding:
            EdgeInsets.zero, // Removemos o espaçamento interno padrão
        content: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10.0), // Bordas arredondadas
          ),
          padding: EdgeInsets.all(20.0), // Espaçamento interno
          child: Column(
            mainAxisSize: MainAxisSize.min, // Ocupa o mínimo de espaço vertical
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 48.0,
              ),
              SizedBox(height: 10.0),
              const Text(
                'Corretora Cadastrada',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  isFormValid.value = false;
                  cpfController.value.clear();
                  contaController.value.clear();
                  aniversarioController.value.clear();
                  assinaturaController.value.clear();
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Cor de fundo do botão
                ),
                child: Text(
                  'Ok',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } catch (e) {
      Get.defaultDialog(
        backgroundColor: Colors
            .transparent, // Removemos a cor de fundo para personalizar o diálogo
        contentPadding:
            EdgeInsets.zero, // Removemos o espaçamento interno padrão
        content: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10.0), // Bordas arredondadas
          ),
          padding: EdgeInsets.all(20.0), // Espaçamento interno
          child: Column(
            mainAxisSize: MainAxisSize.min, // Ocupa o mínimo de espaço vertical
            children: [
              const Icon(
                Icons.dangerous,
                color: Colors.red,
                size: 48.0,
              ),
              SizedBox(height: 10.0),
              const Text(
                'Erro ao cadastrar corretora',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  cpfController.value.clear();
                  contaController.value.clear();
                  aniversarioController.value.clear();
                  assinaturaController.value.clear();
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Cor de fundo do botão
                ),
                child: Text(
                  'Ok',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  var isFormValid = false.obs;
}
