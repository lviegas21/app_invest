// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'text_item.dart';

class RelatorioFinanceiro extends StatelessWidget {
  final String titleTopoLeft;
  final String titleTopoRight;
  final String contentBottomLeft;
  final String contentBottomRight;
  final Color color;
  const RelatorioFinanceiro({
    this.color = Colors.black,
    required this.titleTopoLeft,
    required this.titleTopoRight,
    required this.contentBottomLeft,
    required this.contentBottomRight,
  });
//this.color = const Color.fromRGBO(26, 40, 66, 1),
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.only(top: 4, right: 8, left: 8, bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextItem(
            title: titleTopoLeft,
            content: titleTopoRight,
            colorContent: Colors.white,
            colorTitle: Colors.white,
            showDivider: false,
          ),
          const SizedBox(
            height: 8,
          ),
          TextItem(
            title: contentBottomLeft,
            content: contentBottomRight,
            colorContent: Colors.white,
            colorTitle: Colors.white,
            showDivider: false,
          ),
        ],
      ),
    );
  }
}
