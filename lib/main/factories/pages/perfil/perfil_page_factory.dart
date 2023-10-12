import 'package:bolsa_valores/ui/perfil/perfil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../ui/perfil/perfil_presenter.dart';
import 'perfil_presenter_factory.dart';

Widget makePerfilPageFactory() {
  final presenter = Get.put<PerfilPresenter>(makePerfilPresenter());
  return PerfilPage(presenter: presenter);
}
