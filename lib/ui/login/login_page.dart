// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:bolsa_valores/ui/login/components/button_components.dart';
import 'package:bolsa_valores/ui/login/components/components.dart';
import 'package:bolsa_valores/ui/login/login_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/screen_size.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final LoginPresenter presenter;
  const LoginPage({required this.presenter});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    void _hideKeyboard() {
      final currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(90)),
              ),
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.blockSizeVertical! * 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // Centralizar o título e a imagem
                    children: [
                      Expanded(
                        child: Text(
                          "Entrar".toUpperCase(),
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.caption?.copyWith(
                              fontWeight: FontWeight.w200,
                              fontSize: SizeConfig.blockSizeHorizontal! * 7),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: SizeConfig.blockSizeHorizontal! * 50,
                          height: SizeConfig.blockSizeVertical! * 10,
                          child: Image.asset("assets/logo.png"),
                        ),
                      ),
                      SizedBox(
                          width: 16), // Espaçamento entre a imagem e o título
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical! * 6),
            Container(
              child: Form(
                child: Column(
                  children: [
                    const EmailComponents(),
                    const SizedBox(height: 20),
                    const SenhaComponents(),
                    const SizedBox(height: 40),
                    LoginButton(
                      horizontalPadding: 10,
                    ),
                    const SizedBox(height: 40),
                    TextButton(
                      onPressed: () => Get.toNamed("/cadastro"),
                      child: Text(
                        "Não é usuário ainda? Clique aqui",
                        style: TextStyle(
                          color: Colors.black, // Cor do texto preta
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
            ),
          ],
        ),
      ),
    );
  }
}
