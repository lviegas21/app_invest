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

  const PagamentoEntity({
    this.cod_boleto,
    this.data_pagamento,
    this.isPagou,
    this.usuario_referencia,
    this.chave_cpf,
    this.cidade,
    this.nome_recebedor,
    this.valor,
  });

  factory PagamentoEntity.fromJson(Map<String, dynamic> json) {
    return PagamentoEntity(
      cod_boleto: json['cod_boleto'] as String?,
      data_pagamento: json['data_pagamento'] as String?,
      isPagou: json['isPagou'] as bool?,
      usuario_referencia: json['usuario_referencia'] as String?,
      chave_cpf: json['chave_cpf'] as String?,
      cidade: json['cidade'] as String?,
      nome_recebedor: json['nome_recebedor'] as String?,
      valor: json['valor'] as String?,
    );
  }

  @override
  List<Object?> get props => [
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
