import 'package:bolsa_valores/domain/entities/investimento_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomePresenter {
  dynamic get uid;
  dynamic get params;
  RxMap get result;
  Rx<InvestimentoEntity> get investimento;
  Rx<String> get selectedMonth;
  Rx<TextEditingController> get controllerMes;
  Future<void> loadFinancaMes();
}
