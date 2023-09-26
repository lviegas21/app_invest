import 'package:flutter/material.dart';

import '../../../util/screen_size.dart';

import 'package:flutter/material.dart';

class NotFoundItems extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final bool subtitle;

  const NotFoundItems({
    Key? key,
    this.title,
    this.icon,
    this.subtitle = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.money_off,
          size: 100,
          color: Colors.black,
        ),
        SizedBox(height: 16), // Espaço entre o ícone e o texto
        Text(
          title ??
              'Escolha um mês para ver os lançamentos dos investimentos feitos',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
