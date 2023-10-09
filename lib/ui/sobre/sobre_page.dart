import 'package:flutter/material.dart';

import 'sobre_presenter.dart';

class SobrePage extends StatelessWidget {
  final SobrePresenter presenter;
  SobrePage({super.key, required this.presenter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Informações da Empresa',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        // Adicionar um botão de voltar no AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Fecha a página atual
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            // Imagem de cabeçalho
            Container(
              height: 200, // Ajuste a altura da imagem conforme necessário
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/imagem_empresa.jpeg'), // Substitua pelo seu próprio asset
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            // Seção de detalhes da empresa
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.business,
                        color: Colors.black,
                        size: 32.0,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'Capacitar Investimento',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: Colors.black, fontSize: 22),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Descrição da empresa aqui. Você pode adicionar informações sobre a empresa, sua missão, visão, valores e muito mais.',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Icon(
                        Icons.call,
                        color: Colors.black,
                        size: 32.0,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'Contatos',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: Colors.black, fontSize: 22),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Endereço: Rua da Empresa, 1234',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'Telefone: (123) 456-7890',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'Email: contato@empresa.com',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Text(
                        'Siga-nos: ',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      GestureDetector(
                        onTap: () {
                          // Abra a página do Facebook aqui
                        },
                        child: Icon(
                          Icons.facebook,
                          color: Colors.blue,
                          size: 32.0,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      // GestureDetector(
                      //   onTap: () {
                      //     // Abra a página do Twitter aqui
                      //   },
                      //   child: Icon(
                      //     Icons.twitter,
                      //     color: Colors.blue,
                      //     size: 32.0,
                      //   ),
                      // ),
                      SizedBox(width: 8.0),
                      // GestureDetector(
                      //   onTap: () {
                      //     // Abra a página do Instagram aqui
                      //   },
                      //   child: Icon(
                      //     Icons.instagram,
                      //     color: Colors.blue,
                      //     size: 32.0,
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
