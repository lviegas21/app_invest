import 'package:bolsa_valores/main/factories/pages/cadastro/cadastro_page_factory.dart';
import 'package:bolsa_valores/main/factories/pages/home/home_page_factory.dart';
import 'package:bolsa_valores/main/factories/pages/login/login_page_factory.dart';
import 'package:bolsa_valores/main/factories/pages/pagamento/pagamento_page_refactor.dart';
import 'package:bolsa_valores/main/factories/pages/sobre/sobre.dart';
import 'package:bolsa_valores/main/factories/pages/splash/splash.dart';
import 'package:bolsa_valores/util/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        GetPage(
          name: '/home',
          page: maskeHomePage,
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/pagamento',
          page: makePagementoPage,
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/sobre',
          page: makeSobrePage,
          transition: Transition.fadeIn,
        ),
      ],
    );
  }
}
