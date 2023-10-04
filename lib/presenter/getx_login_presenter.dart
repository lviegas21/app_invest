import 'package:bolsa_valores/domain/usecase/authetication.dart';
import 'package:bolsa_valores/ui/login/login_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxLoginPresenter extends GetxController implements LoginPresenter {
  final Authentication authentication;
  GetxLoginPresenter({required this.authentication});

  @override
  Rx<TextEditingController> cpfController = TextEditingController().obs;

  @override
  Rx<TextEditingController> senhaController = TextEditingController().obs;

  @override
  var isValid = false.obs;

  @override
  void validate(String value) => isValid.value = cpfController.value.text.isNotEmpty && senhaController.value.text.isNotEmpty && senhaController.value.text.length > 5;

  @override
  Future<void> loadLogin() async {
    try {
      AuthenticationParams params = AuthenticationParams(email: cpfController.value.text, secret: senhaController.value.text);
      final result = await authentication.auth(params);
      Get.offAllNamed("/home", arguments: [result.user.uid, params]);
    } catch (e) {
      cpfController.value.clear();
      senhaController.value.clear();
      Get.defaultDialog(
        backgroundColor: Colors.black,
        title: 'Erro',
        titleStyle: TextStyle(color: Colors.white),
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
}
