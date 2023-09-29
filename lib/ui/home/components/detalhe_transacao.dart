// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_presenter.dart';
import 'text_item.dart';

import 'package:flutter/material.dart';

class DetalheTransacao extends StatelessWidget {
  const DetalheTransacao({Key? key});

  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<HomePresenter>();

    return Obx(
      () => Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black, // Cor de fundo do card (preta)
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 8,
              spreadRadius: 2,
              color: Colors.grey.withOpacity(0.3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                color: Colors.amber, // Cor do cabeçalho (amarelo queimado)
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 10),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Detalhes do Investimento",
                          style: TextStyle(
                            color: Colors.black, // Cor do texto (preta)
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextItem(
                      title: 'Ação',
                      content: presenter.investimento.value.acao.toString(),
                      colorTitle: Colors.white,
                      colorContent: Colors.white,
                    ),
                    TextItem(
                      title: presenter.investimento.value.qtd_papel.toString(),
                      content:
                          presenter.investimento.value.valor_acao.toString(),
                      colorTitle: Colors.white,
                      colorContent: Colors.white,
                    ),
                    TextItem(
                      title: 'Valor Investido',
                      content: presenter.investimento.value.valor_total_aportado
                          .toString(), //valor por papel adc no firebase
                      colorTitle: Colors.white,
                      colorContent: Colors.white,
                    ),
                    TextItem(
                      title: 'Vencimento',
                      content:
                          presenter.investimento.value.data_detalhe.toString(),
                      colorTitle: Colors.white,
                      colorContent: Colors.white,
                    ),
                    TextItem(
                      title: 'Rendimento %',
                      content: '${presenter.investimento.value.rendimento} %',
                      colorTitle: Colors.white,
                      colorContent: Colors.white,
                    ),
                    TextItem(
                      title:
                          'R\$ ${presenter.investimento.value.varia_valor_papel}',
                      content:
                          'R\$ ${presenter.investimento.value.valor_total_papel}',
                      colorTitle: Colors.white,
                      colorContent: Colors.white,
                    ),
                    TextItem(
                      title: 'ESTRATÉGIA',
                      content:
                          presenter.investimento.value.estrategia.toString(),
                      colorTitle: Colors.white,
                      colorContent: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
