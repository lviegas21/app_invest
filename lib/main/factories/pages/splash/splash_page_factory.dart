import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../ui/splash/splash.dart';
import 'splash_presenter_factory.dart';

Widget makeSplashPage() {
  final presenter = Get.put<SplashPresenter>(makeSplashPresenter());
  return SplashPage(presenter: presenter);
}
