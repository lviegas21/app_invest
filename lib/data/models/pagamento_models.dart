import 'package:bolsa_valores/domain/entities/entities.dart';

class PagamentoModels {
  final String? cod_boleto;
  final String? data_pagamento;
  final bool? isPagou;
  final String? usuario_referencia;

  PagamentoModels({
    this.cod_boleto,
    this.data_pagamento,
    this.isPagou,
    this.usuario_referencia,
  });

  factory PagamentoModels.fromJson(Map json) {
    return PagamentoModels(
      cod_boleto: json["cod_boleto"],
      data_pagamento: json["data_pagamento"],
      isPagou: json["isPagou"],
      usuario_referencia: json["usuario_referencia"],
    );
  }

  PagamentoEntity toEntity() => PagamentoEntity(
        cod_boleto: cod_boleto,
        data_pagamento: data_pagamento,
        isPagou: isPagou,
        usuario_referencia: usuario_referencia,
      );
}
