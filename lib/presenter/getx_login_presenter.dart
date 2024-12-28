import 'package:bolsa_valores/domain/usecase/authetication.dart';
import 'package:bolsa_valores/ui/login/login_presenter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxLoginPresenter extends GetxController implements LoginPresenter {
  final Authentication authentication;
  GetxLoginPresenter({required this.authentication});

  @override
  Rx<TextEditingController> emailController = TextEditingController().obs;

  @override
  Rx<TextEditingController> senhaController = TextEditingController().obs;

  @override
  var isValid = false.obs;

  @override
  var isLoading = false.obs;

  @override
  void validate(String value) =>
      isValid.value = emailController.value.text.isNotEmpty &&
          emailController.value.text.contains('@') &&
          senhaController.value.text.isNotEmpty &&
          senhaController.value.text.length > 5;

  @override
  Future<void> loadLogin() async {
    try {
      isLoading.value = true;
      final email = emailController.value.text.trim();
      final password = senhaController.value.text;

      debugPrint('Tentando login com email: $email');

      final params = AuthenticationParams(email: email, secret: password);
      final result = await authentication.auth(params);

      debugPrint('Resultado do login: $result');

      if (result.user.uid != null) {
        debugPrint('Login bem sucedido, navegando para /home');
        Get.offAllNamed("/home", arguments: [result.user.uid, params]);
      } else {
        debugPrint('Login falhou - uid é nulo');
        throw FirebaseAuthException(
            code: 'unknown', message: 'Erro desconhecido ao fazer login');
      }
    } on FirebaseAuthException catch (e) {
      debugPrint('FirebaseAuthException: ${e.code} - ${e.message}');
      String message = switch (e.code) {
        'user-not-found' => 'Usuário não encontrado',
        'wrong-password' => 'Senha incorreta',
        'invalid-email' => 'Email inválido',
        'user-disabled' => 'Usuário desabilitado',
        _ => 'Erro ao fazer login',
      };
      Get.snackbar(
        'Erro',
        message,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      debugPrint('Erro no login: $e');
      Get.snackbar(
        'Erro',
        'Ocorreu um erro ao fazer login',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
