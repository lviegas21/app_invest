// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'text_item.dart';

class DetalheTransacao extends StatelessWidget {
  const DetalheTransacao({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white, // Cor de fundo do card
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 8,
            spreadRadius: 2,
            color: Colors.grey.withOpacity(0.3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              color: Colors.black, // Cor do cabeçalho
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 10),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Detalhes do Investimento",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextItem(
                    title: 'BBDC4',
                    content: 'Ação',
                  ),
                  TextItem(
                    title: 'R\$',
                    content: 'R\$',
                  ),
                  TextItem(
                    title: '20/10/2023',
                    content: '0,17',
                  ),
                  TextItem(
                    title: '7500',
                    content: '1.275,00',
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
