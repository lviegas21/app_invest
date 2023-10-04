// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bolsa_valores/ui/cadastro/cadastro_presenter.dart';
import 'package:flutter/material.dart';

import '../../util/screen_size.dart';
import '../login/components/email_components.dart';
import 'components/button_cadastro_components.dart';
import 'components/cpf_cadastro_components.dart';
import 'components/email_cadastro_components.dart';
import 'components/nome_cadastro_components.dart';
import 'components/senha_cadastro_components.dart';

class CadastroPage extends StatelessWidget {
  final CadastroPresenter presenter;
  const CadastroPage({required this.presenter});

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
      //backgroundColor: AppColor.colorPage,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90))),
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.blockSizeVertical! * 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Cadastro".toUpperCase(),
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.caption?.copyWith(fontWeight: FontWeight.w200, fontSize: SizeConfig.blockSizeHorizontal! * 7),
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal! * 50,
                        height: SizeConfig.blockSizeVertical! * 10,
                        child: Image.asset("assets/logo.png"),
                      ),
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
                    const NomeCadastroComponents(),
                    const SizedBox(
                      height: 20,
                    ),
                    const EmailCadastroComponents(),
                    const SizedBox(
                      height: 20,
                    ),
                    const CpfCadastroComponents(),
                    const SizedBox(
                      height: 20,
                    ),
                    const SenhaCadastroComponents(
                      text: 'Senha',
                    ),

                    const SizedBox(
                      height: 40,
                    ),
                    const CadastroComponentsButton(
                      horizontalPadding: 10,
                    ),
                    const SizedBox(
                      height: 40,
                    ),

                    // LoginButton(horizontalPadding: 10)
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom))
          ],
        ),
      ),
    );
  }

  //  void handleMainError(Rxn<String>? stream, BuildContext context) {
  //     stream?.value = null;

  //    if (stream?.value != null) {

  //       Scaffold.of(context).showSnackBar(SnackBar(content: Text(stream.toString())));
  //    }
  //     error = null;
  //    // stream.close();

  //   stream?.value = null;
}
