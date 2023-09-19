import 'package:bolsa_valores/ui/splash/splash_presenter.dart';
import 'package:get/get.dart';

class GetxSplashPresenter extends GetxController implements SplashPresenter {
  @override
  DateTime? anoAtual;
  GetxSplashPresenter();

  @override
  void onInit() async {
    anoAtual = DateTime.now();
    await Future.delayed(const Duration(seconds: 10));
    Get.offAllNamed("/login");
    super.onInit();
  }
}
