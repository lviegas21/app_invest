// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bolsa_valores/ui/home/components/relatorio_item.dart';
import 'package:bolsa_valores/ui/home/components/text_item.dart';
import 'package:flutter/material.dart';

class DataBase extends StatelessWidget {
  const DataBase({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Para ocupar toda a largura disponível
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
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
                    'Relatorio do Investimento',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Expanded(
                    child: ListView(
                  children: [
                    RelatorioFinanceiro(
                      titleTopoLeft: '2022',
                      titleTopoRight: 'R\$',
                      contentBottomLeft: 'Capital Aportado',
                      contentBottomRight: '1.000,00',
                    ),
                    Divider(
                      height: 1,
                      color: Colors.white,
                    ),
                    RelatorioFinanceiro(
                      titleTopoLeft: '2023',
                      titleTopoRight: 'R\$',
                      contentBottomLeft: 'Provento a Receber',
                      contentBottomRight: '10,00',
                    ),
                    Divider(
                      height: 1,
                      color: Colors.white,
                    ),
                    RelatorioFinanceiro(
                      titleTopoLeft: '25/07/2023',
                      titleTopoRight: 'R\$',
                      contentBottomLeft: 'Saldo em',
                      contentBottomRight: '1.200,00',
                    ),
                    Divider(
                      height: 1,
                      color: Colors.white,
                    ),
                    RelatorioFinanceiro(
                      titleTopoLeft: '19/06/2023',
                      titleTopoRight: 'R\$',
                      contentBottomLeft: 'Em Operação',
                      contentBottomRight: '100,00',
                    ),
                    Divider(
                      height: 1,
                      color: Colors.white,
                    ),
                    RelatorioFinanceiro(
                      titleTopoLeft: '',
                      titleTopoRight: 'R\$',
                      contentBottomLeft: 'Saldo + Provento',
                      contentBottomRight: '1.210,00',
                      //color: Color.fromRGBO(255, 215, 0, 1.0),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.white,
                    ),
                    RelatorioFinanceiro(
                      titleTopoLeft: '',
                      titleTopoRight: 'R\$',
                      contentBottomLeft: 'Ganho real',
                      contentBottomRight: '1.210,00',
                      // color: Color.fromRGBO(255, 215, 0, 1.0),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.white,
                    ),
                    RelatorioFinanceiro(
                      titleTopoLeft: '',
                      titleTopoRight: '%',
                      contentBottomLeft: 'Ganho percentual',
                      contentBottomRight: '25,26',
                      //color: Color.fromRGBO(255, 215, 0, 1.0),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.white,
                    ),
                    RelatorioFinanceiro(
                      titleTopoLeft: '',
                      titleTopoRight: '%',
                      contentBottomLeft: 'Poupança',
                      contentBottomRight: '5,39',
                      // color: Color.fromRGBO(255, 215, 0, 1.0),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.white,
                    ),
                  ],
                ))

                //RelatorioFinanceiro(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
