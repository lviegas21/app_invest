import 'package:bolsa_valores/main/factories/pages/pagamento/pagamento_presenter_refactor.dart';
import 'package:bolsa_valores/ui/pagamento/pagamento_page.dart';
import 'package:bolsa_valores/ui/pagamento/pagamento_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget makePagementoPage() {
  final presenter = Get.put<PagamentoPresenter>(makePagamentoPresenter());
  return PagamentoPage(presenter: presenter);
}
