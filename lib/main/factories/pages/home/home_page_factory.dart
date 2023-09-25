import 'package:bolsa_valores/ui/home/home_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../ui/home/home_presenter.dart';
import 'home_presenter_factory.dart';

Widget maskeHomePage() {
  final presenter = Get.put<HomePresenter>(makeHomePresenter());
  return HomePage(presenter: presenter);
}
