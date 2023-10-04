import 'package:bolsa_valores/ui/cadastro/cadastro_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CpfCadastroComponents extends StatelessWidget {
  const CpfCadastroComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<CadastroPresenter>();
    final maskCpf = MaskTextInputFormatter(mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: TextField(
          inputFormatters: [maskCpf],
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          controller: presenter.cpfController.value,
          cursorColor: const Color(0xFF0F192C),
          style: const TextStyle(color: Color(0xFF0F192C), fontSize: 18),
          onChanged: presenter.validate,
          decoration: InputDecoration(
            fillColor: const Color.fromARGB(179, 219, 216, 216),
            filled: true,
            border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
            labelStyle: const TextStyle(color: Color(0xFF0F192C)),
            prefixIcon: const Icon(Icons.person, color: Color(0xFF0F192C)),
            hintText: "CPF",
            //errorText: presenter.cpfError.value?.isEmpty == true
            //? null
            // : presenter.cpfError.value,
          ),
        ),
      ),
    );
  }
}
