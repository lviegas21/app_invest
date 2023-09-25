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
  void validate(String value) =>
      isValid.value = cpfController.value.text.isNotEmpty &&
          senhaController.value.text.isNotEmpty;

  @override
  Future<void> loadLogin() async {
    AuthenticationParams params = AuthenticationParams(
        cpf: cpfController.value.text, secret: senhaController.value.text);
    final result = await authentication.auth(params);

    Get.toNamed("/home", arguments: [result.user.uid, params]);
  }
}
