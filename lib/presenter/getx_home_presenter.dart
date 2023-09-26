import 'package:bolsa_valores/domain/entities/investimento_entity.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:get/get.dart';

import '../domain/usecase/usecase.dart';
import '../ui/home/home_presenter.dart';
import '../util/enum_meses.dart';

class GetxHomePresenter extends GetxController implements HomePresenter {
  final QueryResultInvestimento queryResultInvestimento;
  GetxHomePresenter({required this.queryResultInvestimento});
  @override
  dynamic params = Get.arguments.last;

  @override
  dynamic uid = Get.arguments.first;

  @override
  void onInit() async {}

  @override
  RxMap result = {}.obs;

  @override
  Rx<InvestimentoEntity> investimento = const InvestimentoEntity().obs;

  @override
  Rx<String> selectedMonth = EnumMeses.jan.descricao.toString().obs;

  @override
  Rx<TextEditingController> controllerMes = TextEditingController().obs;

  @override
  Future<void> loadFinancaMes() async {
    DateTime now = DateTime.now();
    investimento.value =
        await queryResultInvestimento.loadDetalheInvestimentoData(
            '${controllerMes.value.text}/${now.year}', uid);
  }
}
