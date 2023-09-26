// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bolsa_valores/ui/home/components/appbar_widget.dart';
import 'package:bolsa_valores/ui/home/components/detalhe_transacao.dart';
import 'package:bolsa_valores/ui/home/components/not_found_components.dart';
import 'package:bolsa_valores/ui/home/home_presenter.dart';
import 'package:bolsa_valores/util/enum_meses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'components/data_base.dart';
import 'components/drawer.dart';
import 'components/text_item.dart';

class HomePage extends StatelessWidget {
  final HomePresenter presenter;
  const HomePage({super.key, required this.presenter});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: appBarWidget(
            context,
            EnumMeses.values
                .map((e) => {"id": e.id, "descricao": e.descricao})
                .toList(),
            presenter.selectedMonth),
        drawer: DrawerComponents(),
        body: presenter.investimento.value.acao == null
            ? NotFoundItems()
            : Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: DetalheTransacao(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(child: DataBase())
                ],
              ),
      ),
    );
  }
}
