// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TextItem extends StatelessWidget {
  final String title;
  final String content;
  final double fontSize;
  final FontWeight fontWeight;
  final Color colorContent;
  final Color colorTitle;
  final bool isIcon;
  final Icon? icon;
  final AlignmentGeometry alignmentGeometry;
  final bool showDivider;
  const TextItem(
      {Key? key,
      required this.title,
      required this.content,
      this.fontSize = 14,
      this.fontWeight = FontWeight.bold,
      this.colorContent = Colors.black,
      this.colorTitle = Colors.black,
      this.isIcon = false,
      this.alignmentGeometry = Alignment.centerRight,
      this.icon,
      this.showDivider = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isIcon == true
                ? Padding(
                    padding: const EdgeInsets.only(right: 12, left: 12),
                    child: icon!,
                  )
                : Container(),
            SizedBox(
                width:
                    16), // Aumentamos o espaçamento entre o ícone (se presente) e o texto
            Padding(
              padding: EdgeInsets.only(left: 0),
              child: Text(title.toUpperCase(),
                  style: TextStyle(
                    color: colorTitle,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                  )),
            ),
            SizedBox(
                width:
                    16), // Aumentamos o espaçamento entre o título e o conteúdo
            Expanded(
              child: Align(
                alignment: alignmentGeometry,
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child:
                      Text(content.isNotEmpty ? content.toUpperCase() : 'N/I',
                          maxLines: 1,
                          style: TextStyle(
                            color: colorContent,
                            fontSize: fontSize,
                            fontWeight: fontWeight,
                          )),
                ),
              ),
            ),
          ],
        ),
        if (showDivider)
          Divider(
            height: 2,
            indent: 14,
            color: Colors.grey,
          ),
        SizedBox(
          height: 0,
        ), // Aumentamos o espaçamento entre os itens
      ],
    );
  }
}
