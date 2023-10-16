import 'package:bolsa_valores/ui/cadastro/cadastro_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../perfil_presenter.dart';

class TextFormFieldComponents extends StatelessWidget {
  final IconData icon;
  final List<TextInputFormatter>? inputFormatters;
  final Rx<TextEditingController> controller;
  final String text;
  final TextInputType keyboardType;
  const TextFormFieldComponents(
      {Key? key,
      this.inputFormatters,
      required this.controller,
      required this.text,
      required this.icon,
      required this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<PerfilPresenter>();

    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: TextField(
          inputFormatters: inputFormatters,
          textInputAction: TextInputAction.next,
          keyboardType: keyboardType,
          controller: controller.value,
          cursorColor: const Color(0xFF0F192C),
          style: const TextStyle(
              color: Color(0xFF0F192C),
              fontWeight: FontWeight.normal,
              fontSize: 14),
          onChanged: presenter.validate,
          decoration: InputDecoration(
            fillColor: const Color.fromARGB(179, 219, 216, 216),
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)),
            labelStyle: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
                color: Colors.black),
            prefixIcon: Icon(icon, color: const Color(0xFF0F192C)),
            label: Text(text),

            //errorText: presenter.cpfError.value?.isEmpty == true
            //? null
            // : presenter.cpfError.value,
          ),
        ),
      ),
    );
  }
}
