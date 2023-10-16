import 'package:equatable/equatable.dart';

class PagamentoEntity extends Equatable {
  final String? cod_boleto;
  final String? data_pagamento;
  final bool? isPagou;
  final String? usuario_referencia;
  final String? chave_cpf;
  final String? cidade;
  final String? nome_recebedor;
  final String? valor;

  PagamentoEntity({
    this.cod_boleto,
    this.data_pagamento,
    this.isPagou,
    this.usuario_referencia,
    this.chave_cpf,
    this.cidade,
    this.nome_recebedor,
    this.valor,
  });

  List get props => [
        cod_boleto,
        data_pagamento,
        isPagou,
        usuario_referencia,
        chave_cpf,
        cidade,
        nome_recebedor,
        valor,
      ];
}
