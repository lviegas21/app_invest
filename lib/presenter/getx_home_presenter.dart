import 'package:get/get.dart';

import '../domain/usecase/usecase.dart';
import '../ui/home/home_presenter.dart';

class GetxHomePresenter extends GetxController implements HomePresenter {
  final QueryResultInvestimento queryResultInvestimento;
  GetxHomePresenter({required this.queryResultInvestimento});
  @override
  dynamic params = Get.arguments.last;

  @override
  dynamic uid = Get.arguments.first;

  @override
  void onInit() async {
    await queryResultInvestimento.loadDetalheInvestimentoData(
        '25/10/2023', uid);
  }

  @override
  var result;
}
