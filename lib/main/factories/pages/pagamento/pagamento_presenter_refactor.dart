import '../../../../presenter/getx_pagamento_presenter.dart';
import '../../../../ui/pagamento/pagamento.dart';
import '../../../usecase/remote_query_pay_impl.dart';

PagamentoPresenter makePagamentoPresenter() =>
    GetxPagamentoPresenter(queryConsultaPay: makeRemotePagamentoUsecase());
