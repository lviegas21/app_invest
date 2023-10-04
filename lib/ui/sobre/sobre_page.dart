import 'package:flutter/material.dart';

import 'sobre_presenter.dart';

class SobrePage extends StatelessWidget {
  final SobrePresenter presenter;
  SobrePage({super.key, required this.presenter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações da Empresa'),
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
            // Imagem de cabeçalho
            Container(
              height: 200, // Ajuste a altura da imagem conforme necessário
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/logo.png'), // Substitua pelo seu próprio asset
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Seção de detalhes da empresa
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nome da Empresa',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Descrição da empresa aqui. Você pode adicionar informações sobre a empresa, sua missão, visão, valores e muito mais.',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Contato:',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Endereço: Rua da Empresa, 1234',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    'Telefone: (123) 456-7890',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    'Email: contato@empresa.com',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
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
