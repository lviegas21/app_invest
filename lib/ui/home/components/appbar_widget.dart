import 'package:bolsa_valores/ui/home/home.dart';
import 'package:bolsa_valores/util/enum_meses.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar appBarWidget(
  BuildContext context,
  List? meses,
  Rx<String>? selectedMonth,
) {
  final presenter = Get.find<HomePresenter>();
  return AppBar(
    backgroundColor: Colors.black, // Cor de fundo preta
    title: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Investimentos',
        style: TextStyle(
          color: Colors.white, // Cor do texto branca
        ),
      ),
    ),
    actions: <Widget>[
      Obx(
        () => DropdownButton<String>(
          value: presenter.selectedMonth.value,
          onChanged: (value) {
            presenter.selectedMonth.value = value!;
            var id = meses.firstWhere((e) => value == e["descricao"]);
            presenter.controllerMes.value.text = id["id"];
            presenter.loadFinancaMes();
          },
          items: meses!.map<DropdownMenuItem<String>>((dynamic value) {
            return DropdownMenuItem<String>(
              value: value["descricao"],
              child: Text(
                value["descricao"],
                style: TextStyle(color: Colors.amber), // Cor do texto preta
              ),
            );
          }).toList(),
          dropdownColor: Colors.black, // Cor de fundo do dropdown
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.white, // Cor do ícone branco
          ),
        ),
      ),
    ],
  );
}
