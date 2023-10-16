import 'package:bolsa_valores/util/mask_input.dart';
import 'package:flutter/material.dart';

import 'components/button_components.dart';
import 'components/text_form_field_components.dart';
import 'perfil_presenter.dart';

class PerfilPage extends StatelessWidget {
  final PerfilPresenter presenter;
  const PerfilPage({super.key, required this.presenter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Corretora",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          TextFormFieldComponents(
            controller: presenter.contaController,
            text: 'Número da conta',
            icon: Icons.monetization_on,
            keyboardType: TextInputType.number,
          ),
          TextFormFieldComponents(
            inputFormatters: [maskCpfUser],
            controller: presenter.cpfController,
            text: 'CPF',
            icon: Icons.person,
            keyboardType: TextInputType.number,
          ),
          TextFormFieldComponents(
            inputFormatters: [maskDataNascimento],
            controller: presenter.aniversarioController,
            text: 'Data de Nascimento',
            icon: Icons.date_range,
            keyboardType: TextInputType.number,
          ),
          TextFormFieldComponents(
            controller: presenter.assinaturaController,
            text: 'Assinatura Eletrônica',
            keyboardType: TextInputType.text,
            icon: Icons.pending,
          ),
          Spacer(),
          ButtonComponents(
            horizontalPadding: 10,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
