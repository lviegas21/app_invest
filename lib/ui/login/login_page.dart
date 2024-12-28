// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bolsa_valores/ui/login/components/button_components.dart';
import 'package:bolsa_valores/ui/login/components/components.dart';
import 'package:bolsa_valores/ui/login/login_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/screen_size.dart';

class LoginPage extends StatelessWidget {
  final LoginPresenter presenter;
  const LoginPage({super.key, required this.presenter});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    void _hideKeyboard() {
      final currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: _hideKeyboard,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                colorScheme.primary,
                colorScheme.primaryContainer,
              ],
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.blockSizeVertical! * 8,
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.account_balance,
                          size: 80,
                          color: colorScheme.onPrimary,
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                        Text(
                          "Invest App",
                          style: textTheme.headlineLarge?.copyWith(
                            color: colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 1),
                        Text(
                          "Seu portal de investimentos",
                          style: textTheme.titleMedium?.copyWith(
                            color: colorScheme.onPrimary.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal! * 8,
                      vertical: SizeConfig.blockSizeVertical! * 4,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, -5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bem-vindo",
                          style: textTheme.headlineSmall?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Faça login para continuar",
                          style: textTheme.bodyLarge?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 4),
                        EmailComponents(),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                        SenhaComponents(),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 3),
                        LoginButton(
                          horizontalPadding: 0,
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Não tem uma conta?",
                              style: textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            TextButton(
                              onPressed: () => Get.toNamed('/cadastro'),
                              child: Text(
                                'Criar conta',
                                style: textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
