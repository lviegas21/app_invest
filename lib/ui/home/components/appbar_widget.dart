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
      IconButton(
        icon: Icon(Icons.date_range),
        onPressed: () {
          _showDateSelectionModal(context, presenter, meses);
        },
      ),
    ],
  );
}

void _showDateSelectionModal(
    BuildContext context, HomePresenter presenter, List? meses) {
  showModalBottomSheet(
    backgroundColor: Colors
        .transparent, // Remova a cor de fundo para ter um visual mais limpo
    context: context,
    builder: (BuildContext context) {
      return Obx(
        () => Center(
          child: Container(
            margin: EdgeInsets.all(
                16.0), // Adicione margens para espaçamento externo
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius:
                  BorderRadius.circular(12.0), // Adicione cantos arredondados
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3), // Adicione sombra
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButton<String>(
                  value: presenter.selectedMonth.value,
                  onChanged: (value) {
                    presenter.selectedMonth.value = value!;
                    var id = meses.firstWhere((e) => value == e["descricao"]);
                    presenter.controllerMes.value.text = id["id"];
                  },
                  items: meses!.map<DropdownMenuItem<String>>((dynamic value) {
                    return DropdownMenuItem<String>(
                      value: value["descricao"],
                      child: Text(
                        value["descricao"],
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 18.0,
                        ),
                      ),
                    );
                  }).toList(),
                  dropdownColor: Colors.black,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16.0),
                DropdownButton<int>(
                  dropdownColor: Colors.black,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  value: presenter.controllerAno.value,
                  onChanged: (value) {
                    presenter.controllerAno.value = value!;
                  },
                  items: List<DropdownMenuItem<int>>.generate(10, (index) {
                    return DropdownMenuItem<int>(
                      value: DateTime.now().year - 5 + index,
                      child: Text(
                        (DateTime.now().year - 5 + index).toString(),
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 18.0,
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    presenter.loadFinancaMes();
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber, // Cor de fundo personalizada
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8.0), // Cantos arredondados do botão
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 12.0), // Espaçamento vertical do botão
                    child: Center(
                      child: Text(
                        "Confirmar",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
