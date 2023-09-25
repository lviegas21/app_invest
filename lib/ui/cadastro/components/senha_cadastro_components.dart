import 'package:bolsa_valores/ui/cadastro/cadastro_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SenhaCadastroComponents extends StatelessWidget {
  final String text;
  const SenhaCadastroComponents({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<CadastroPresenter>();

    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: TextField(
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.visiblePassword,
          controller: presenter.senhaController.value,
          cursorColor: const Color(0xFF0F192C),
          style: const TextStyle(color: Color(0xFF0F192C), fontSize: 18),
          onChanged: presenter.validate,
          decoration: InputDecoration(
            fillColor: Color.fromARGB(179, 219, 216, 216),
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)),
            labelStyle: const TextStyle(color: Color(0xFF0F192C)),
            prefixIcon: const Icon(Icons.person, color: Color(0xFF0F192C)),
            hintText: text,
            //errorText: presenter.cpfError.value?.isEmpty == true
            //? null
            // : presenter.cpfError.value,
          ),
        ),
      ),
    );
  }
}
