// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bolsa_valores/ui/home/components/relatorio_item.dart';
import 'package:bolsa_valores/ui/home/components/text_item.dart';
import 'package:bolsa_valores/ui/home/home_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

class DataBase extends StatelessWidget {
  const DataBase({Key? key});

  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<HomePresenter>();
    return Obx(
      () => Container(
        width: double.infinity, // Para ocupar toda a largura disponível
        child: Card(
          elevation: 4.0,
          margin: EdgeInsets.all(16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.amber, // Cor de fundo do card (preta)
          child: InkWell(
            onTap: () {
              // Adicione ação a ser executada quando o card for pressionado.
            },
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 8.0),
                  Center(
                    child: Text(
                      'Relatório do Investimento',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black, // Cor do texto branca
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Expanded(
                    child: ListView(
                      children: [
                        RelatorioFinanceiro(
                          titleTopoLeft: presenter
                              .investimento.value.ano_aportado
                              .toString(),
                          titleTopoRight: 'R\$',
                          contentBottomLeft: 'Capital Aportado',
                          contentBottomRight: presenter
                              .investimento.value.valor_capital_aportado
                              .toString(),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.white,
                        ),
                        RelatorioFinanceiro(
                          titleTopoLeft: presenter
                              .investimento.value.ano_provento
                              .toString(),
                          titleTopoRight: 'R\$',
                          contentBottomLeft: 'Provento a Receber',
                          contentBottomRight: presenter
                              .investimento.value.valor_provento_receber
                              .toString(),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.white,
                        ),
                        RelatorioFinanceiro(
                          titleTopoLeft: presenter.investimento.value.data_saldo
                              .toString(),
                          titleTopoRight: 'R\$',
                          contentBottomLeft: 'Saldo em',
                          contentBottomRight: presenter
                              .investimento.value.valor_saldo
                              .toString(),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.white,
                        ),
                        RelatorioFinanceiro(
                          titleTopoLeft: '',
                          titleTopoRight: 'R\$',
                          contentBottomLeft: 'Saldo + Provento',
                          contentBottomRight: presenter
                              .investimento.value.saldo_provento
                              .toString(),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.white,
                        ),
                        RelatorioFinanceiro(
                          titleTopoLeft: '',
                          titleTopoRight:
                              '% ${presenter.investimento.value.ganho_percentual.toString()}',
                          contentBottomLeft: 'Ganho real',
                          contentBottomRight:
                              'R\$ ${presenter.investimento.value.ganho_real.toString()}',
                        ),
                        Divider(
                          height: 1,
                          color: Colors.white,
                        ),
                        Divider(
                          height: 1,
                          color: Colors.white,
                        ),
                        RelatorioFinanceiro(
                          titleTopoLeft: '',
                          titleTopoRight: '%',
                          contentBottomLeft: 'Poupança',
                          contentBottomRight:
                              presenter.investimento.value.poupanca.toString(),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
