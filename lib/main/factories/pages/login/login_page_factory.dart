import 'package:bolsa_valores/ui/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../ui/login/login_presenter.dart';
import 'login_presenter_factory.dart';

Widget makeLoginPage() {
  final presenter = Get.put<LoginPresenter>(makeLoginPresenter());
  return LoginPage(presenter: presenter);
}
