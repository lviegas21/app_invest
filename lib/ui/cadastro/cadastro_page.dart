// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bolsa_valores/ui/cadastro/cadastro_presenter.dart';
import 'package:flutter/material.dart';

import '../../util/screen_size.dart';
import '../login/components/email_components.dart';
import 'components/button_cadastro_components.dart';
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

    // return Scaffold(
    //   body: SingleChildScrollView(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       crossAxisAlignment: CrossAxisAlignment.stretch,
    //       children: <Widget>[
    //         Container(
    //           width: MediaQuery.of(context).size.width,
    //           height: MediaQuery.of(context).size.height / 2.5,
    //           decoration: BoxDecoration(
    //               gradient: LinearGradient(
    //                 begin: Alignment.topCenter,
    //                 end: Alignment.bottomCenter,
    //                 colors: [Color(0xFF0F192C), Color.fromARGB(255, 26, 40, 66)],
    //               ),
    //               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90))),
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: <Widget>[
    //               Spacer(),
    //               Align(
    //                   alignment: Alignment.topCenter,
    //                   child: SizedBox(
    //                     width: 120,
    //                     height: 120,
    //                     child: Image.asset("assets/imagem.png"),
    //                   )),
    //               Spacer(),
    //               Align(
    //                 alignment: Alignment.bottomRight,
    //                 child: Padding(
    //                   padding: const EdgeInsets.only(bottom: 32, right: 32),
    //                   child: Text(
    //                     'Entrar',
    //                     style: TextStyle(color: Colors.white, fontSize: 38),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         Container(
    //           height: MediaQuery.of(context).size.height / 2,
    //           width: MediaQuery.of(context).size.width,
    //           padding: EdgeInsets.only(top: 62),
    //           child: Column(
    //             children: <Widget>[
    //               const CPFInput(),
    //               SizedBox(height: SizeConfig.blockSizeVertical! * 3),
    //               const PasswordInput(),
    //               Align(
    //                 alignment: Alignment.centerRight,
    //                 child: Padding(
    //                   padding: const EdgeInsets.only(top: 16, right: 32),
    //                   child: Text(
    //                     'Esqueceu sua senha?',
    //                     style: TextStyle(color: Colors.grey),
    //                   ),
    //                 ),
    //               ),
    //               Spacer(),
    //               AnimatedContainer(
    //                 duration: Duration(milliseconds: 200),
    //                 //height: isKeyboardVisible ? 0 : 50.h,
    //                 child: LoginButton(horizontalPadding: SizeConfig.blockSizeHorizontal! * 8),
    //               ),
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );

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
              decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(90))),
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.blockSizeVertical! * 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Cadastro".toUpperCase(),
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.caption?.copyWith(
                            fontWeight: FontWeight.w200,
                            fontSize: SizeConfig.blockSizeHorizontal! * 10),
                      ),
                      SizedBox(
                        width: 90,
                        height: 90,
                        child: Image.asset("assets/logo.png"),
                      )
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
            Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom))
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
