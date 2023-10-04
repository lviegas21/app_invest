// ignore_for_file: implementation_imports

import 'package:bolsa_valores/domain/usecase/authetication.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:get/get.dart';

import '../ui/cadastro/cadastro_presenter.dart';

class GetxCadastroPresenter extends GetxController implements CadastroPresenter {
  final Authentication authentication;
  GetxCadastroPresenter({required this.authentication});

  @override
  Rx<TextEditingController> emailController = TextEditingController().obs;

  @override
  Rx<TextEditingController> cpfController = TextEditingController().obs;

  @override
  var isValid = false.obs;

  @override
  Rx<TextEditingController> nomeController = TextEditingController().obs;

  @override
  Rx<TextEditingController> senhaController = TextEditingController().obs;

  @override
  Future<void> loadCadastro() async {
    try {
      AuthenticationParams params = AuthenticationParams(
        email: emailController.value.text,
        secret: senhaController.value.text,
        nome: nomeController.value.text,
        cpf: cpfController.value.text,
      );
      final resultCadastro = await authentication.signUp(params);
      Get.defaultDialog(
          backgroundColor: Colors.black,
          title: 'Sucesso',
          titleStyle: TextStyle(color: Colors.white),
          middleText: 'Seu cadastro foi salvo com sucesso',
          confirm: TextButton(
            onPressed: () {
              Get.offAllNamed("/home", arguments: [params]);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
            ),
            child: Text('ok', style: TextStyle(color: Colors.black)),
          ));
    } catch (e) {
      Get.defaultDialog(
        backgroundColor: Colors.black,
        title: 'Erro',
        middleText: 'Informações invalidas, verifique as informações preenchidas!',
        confirm: TextButton(
          onPressed: () {
            Get.back();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: Text('ok', style: TextStyle(color: Colors.black)),
        ),
      );
    }
  }

  @override
  void validate(String value) => isValid.value = nomeController.value.text.isNotEmpty &&
      emailController.value.text.isNotEmpty &&
      senhaController.value.text.isNotEmpty &&
      senhaController.value.text.length > 5 &&
      cpfController.value.text.isNotEmpty &&
      cpfController.value.text.length > 10;
}
