import 'package:bolsa_valores/main/factories/pages/cadastro/cadastro_page_factory.dart';
import 'package:bolsa_valores/main/factories/pages/login/login_page_factory.dart';
import 'package:bolsa_valores/main/factories/pages/splash/splash.dart';
import 'package:bolsa_valores/util/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Investimentos',
      debugShowCheckedModeBanner: false,
      theme: makeAppTheme(),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: makeSplashPage,
          transition: Transition.fade,
        ),
        GetPage(
          name: '/login',
          page: makeLoginPage,
          transition: Transition.fade,
        ),
        GetPage(
          name: '/cadastro',
          page: makeCadastroPage,
          transition: Transition.fade,
        ),
      ],
    );
  }
}
