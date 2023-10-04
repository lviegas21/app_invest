import 'package:bolsa_valores/domain/entities/entities.dart';
import 'package:bolsa_valores/domain/entities/investimento_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomePresenter {
  RxBool get isModal;
  dynamic get uid;
  dynamic get params;
  RxMap get result;
  Rx<InvestimentoEntity> get investimento;
  Rx<PagamentoEntity> get pagamento;
  Rx<String> get selectedMonth;
  Rx<TextEditingController> get controllerMes;
  Rx<int> get controllerAno;
  Future<void> loadFinancaMes();
}
