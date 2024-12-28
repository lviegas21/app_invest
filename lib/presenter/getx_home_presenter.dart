import 'package:bolsa_valores/domain/entities/investimento_entity.dart';
import 'package:bolsa_valores/domain/entities/pagamento_entity.dart';
import 'package:flutter/material.dart';
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
  RxMap result = {}.obs;

  @override
  Rx<InvestimentoEntity> investimento = const InvestimentoEntity().obs;

  @override
  Rx<String> selectedMonth = EnumMeses.jan.descricao.toString().obs;

  @override
  Rx<TextEditingController> controllerMes = TextEditingController().obs;

  @override
  Rx<PagamentoEntity> pagamento = PagamentoEntity().obs;

  @override
  RxBool isModal = false.obs;

  @override
  Rx<int> controllerAno = DateTime.now().year.obs;

  @override
  void onInit() async {
    debugPrint('GetxHomePresenter onInit');
    try {
      final result = await verificaUltimoPagamento();
      if (result is Map<String, dynamic>) {
        pagamento.value = PagamentoEntity.fromJson(result);
      } else {
        pagamento.value = PagamentoEntity();
      }

      if (pagamento.value.isPagou == false) {
        Get.defaultDialog(
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          content: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.warning,
                  color: Colors.orange,
                  size: 48.0,
                ),
                SizedBox(height: 10.0),
                Text(
                  'Cobrança Mensal',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Você possui uma cobrança mensal pendente. Acesse o painel de pagamentos e continue em dia.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text(
                    'Ok',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    } catch (e) {
      debugPrint('Erro ao verificar pagamento: $e');
      pagamento.value = PagamentoEntity();
    }
    super.onInit();
  }

  Future<dynamic> verificaUltimoPagamento() async {
    try {
      return await queryResultInvestimento.loadVerificaUltimoPagamento(uid);
    } catch (e) {
      debugPrint('Erro ao verificar último pagamento: $e');
      return null;
    }
  }

  @override
  Future<void> loadFinancaMes() async {
    try {
      investimento.value = await queryResultInvestimento.loadDetalheInvestimentoData(
        '${controllerMes.value.text}/${controllerAno.value}',
        uid,
      );
    } catch (e) {
      debugPrint('Erro ao carregar finanças do mês: $e');
    }
  }
}
