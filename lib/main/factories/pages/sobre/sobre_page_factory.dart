import 'package:bolsa_valores/main/factories/pages/sobre/sobre_presenter_factory.dart';
import 'package:bolsa_valores/ui/sobre/sobre_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../ui/sobre/sobre_presenter.dart';

Widget makeSobrePage() {
  final presenter = Get.put<SobrePresenter>(makeSobrePresenter());
  return SobrePage(presenter: presenter);
}
