import 'package:bolsa_valores/ui/cadastro/cadastro_page.dart';
import 'package:bolsa_valores/ui/cadastro/cadastro_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cadastro_presenter_factory.dart';

Widget makeCadastroPage() {
  final presenter = Get.put<CadastroPresenter>(makeCadastroPresenter());
  return CadastroPage(presenter: presenter);
}
