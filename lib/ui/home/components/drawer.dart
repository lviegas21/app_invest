import 'package:bolsa_valores/ui/home/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

class DrawerComponents extends StatelessWidget {
  const DrawerComponents({Key? key});

  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<HomePresenter>();
    return Drawer(
      backgroundColor: Colors.black, // Cor de fundo preta
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 10),
        children: [
          Container(
            height: 160, // Altura do cabeçalho
            color: Colors.black, // Cor de fundo preta
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white, // Cor de fundo branca
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.black, // Cor do ícone preta
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  presenter.params.cpf,
                  style: TextStyle(
                    color: Colors.white, // Cor do texto branca
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          ListTile(
            title: Text(
              'Pagamentos',
              style: TextStyle(
                color: Colors.amber, // Cor amarelo queimado
              ),
            ),
            onTap: () {
              // Ação para a opção Pagamentos
            },
            // Cor de destaque ao pressionar o botão
            splashColor: Colors.amberAccent,
          ),
          Divider(
            color: Colors.white, // Cor do divisor
            thickness: 1, // Espessura do divisor
          ),
          ListTile(
            title: Text(
              'Cadastro de Investimento',
              style: TextStyle(
                color: Colors.amber, // Cor amarelo queimado
              ),
            ),
            onTap: () {
              // Ação para a opção Cadastro de Investimento
            },
            // Cor de destaque ao pressionar o botão
            splashColor: Colors.amberAccent,
          ),
          Divider(
            color: Colors.white, // Cor do divisor
            thickness: 1, // Espessura do divisor
          ),
          ListTile(
            title: Text(
              'Sair',
              style: TextStyle(
                color: Colors.amber, // Cor amarelo queimado
              ),
            ),
            onTap: () {
              // Ação para a opção Sair
            },
            // Cor de destaque ao pressionar o botão
            splashColor: Colors.amberAccent,
          ),
          Divider(
            color: Colors.white, // Cor do divisor
            thickness: 1, // Espessura do divisor
          ),
        ],
      ),
    );
  }
}
