import 'package:equatable/equatable.dart';

class PagamentoEntity extends Equatable {
  final String? cod_boleto;
  final String? data_pagamento;
  final bool? isPagou;
  final String? usuario_referencia;

  PagamentoEntity({
    this.cod_boleto,
    this.data_pagamento,
    this.isPagou,
    this.usuario_referencia,
  });

  List get props => [cod_boleto, data_pagamento, isPagou, usuario_referencia];
}
