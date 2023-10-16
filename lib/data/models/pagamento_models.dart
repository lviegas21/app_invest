import 'package:bolsa_valores/domain/entities/entities.dart';

class PagamentoModels {
  final String? cod_boleto;
  final String? data_pagamento;
  final bool? isPagou;
  final String? usuario_referencia;
  final String? chave_cpf;
  final String? cidade;
  final String? nome_recebedor;
  final String? valor;

  PagamentoModels({
    this.cod_boleto,
    this.data_pagamento,
    this.isPagou,
    this.usuario_referencia,
    this.chave_cpf,
    this.cidade,
    this.nome_recebedor,
    this.valor,
  });

  factory PagamentoModels.fromJson(Map json) {
    return PagamentoModels(
      cod_boleto: json["cod_boleto"],
      data_pagamento: json["data_pagamento"],
      isPagou: json["isPagou"],
      usuario_referencia: json["usuario_referencia"],
      chave_cpf: json["chave_cpf"],
      cidade: json["cidade"],
      nome_recebedor: json["nome_recebedor"],
      valor: json["valor"],
    );
  }

  PagamentoEntity toEntity() => PagamentoEntity(
        cod_boleto: cod_boleto,
        data_pagamento: data_pagamento,
        isPagou: isPagou,
        usuario_referencia: usuario_referencia,
        chave_cpf: chave_cpf,
        cidade: cidade,
        nome_recebedor: nome_recebedor,
        valor: valor,
      );
}
