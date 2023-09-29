// ignore_for_file: non_constant_identifier_names

import 'package:bolsa_valores/domain/entities/investimento_entity.dart';

class InvestimentoModels {
  final String? acao;
  final String? ano_aportado;
  final String? ano_provento;
  final String? data_detalhe;
  final String? data_operacao;
  final String? data_saldo;
  final String? ganho_percentual;
  final String? ganho_real;
  final String? poupanca;
  final int? qtd_papel;
  final String? referencia_usuario;
  final String? saldo_provento;
  final String? valor_capital_aportado;
  final String? valor_operacao;
  final String? valor_provento_receber;
  final String? valor_saldo;
  final String? valor_total_aportado;
  final String? valor_total_papel;
  final String? varia_valor_papel;
  final String? estrategia;
  final String? valor_acao;

  const InvestimentoModels({
    this.acao,
    this.ano_aportado,
    this.ano_provento,
    this.data_detalhe,
    this.data_operacao,
    this.data_saldo,
    this.ganho_percentual,
    this.ganho_real,
    this.poupanca,
    this.qtd_papel,
    this.referencia_usuario,
    this.saldo_provento,
    this.valor_capital_aportado,
    this.valor_operacao,
    this.valor_provento_receber,
    this.valor_saldo,
    this.valor_total_aportado,
    this.valor_total_papel,
    this.varia_valor_papel,
    this.estrategia,
    this.valor_acao,
  });

  factory InvestimentoModels.fromJson(Map json) {
    return InvestimentoModels(
      acao: json["acao"],
      ano_aportado: json["ano_aportado"],
      ano_provento: json["ano_provento"],
      data_detalhe: json["data_detalhe"],
      data_operacao: json["data_operacao"],
      data_saldo: json["data_saldo"],
      ganho_percentual: json["ganho_percentual"],
      ganho_real: json["ganho_real"],
      poupanca: json["poupanca"],
      qtd_papel: json["qtd_papel"],
      referencia_usuario: json["referencia_usuario"],
      saldo_provento: json["saldo_provento"],
      valor_capital_aportado: json["valor_capital_aportado"],
      valor_operacao: json["valor_operacao"],
      valor_provento_receber: json["valor_provento_receber"],
      valor_saldo: json["valor_saldo"],
      valor_total_aportado: json["valor_total_aportado"],
      valor_total_papel: json["valor_total_papel"],
      varia_valor_papel: json["varia_valor_papel"],
      estrategia: json["estrategia"],
      valor_acao: json["valor_acao"],
    );
  }

  InvestimentoEntity toEntity() => InvestimentoEntity(
        acao: acao,
        ano_aportado: ano_aportado,
        ano_provento: ano_provento,
        data_detalhe: data_detalhe,
        data_operacao: data_operacao,
        data_saldo: data_saldo,
        ganho_percentual: ganho_percentual,
        ganho_real: ganho_real,
        poupanca: poupanca,
        qtd_papel: qtd_papel,
        referencia_usuario: referencia_usuario,
        saldo_provento: saldo_provento,
        valor_capital_aportado: valor_capital_aportado,
        valor_operacao: valor_operacao,
        valor_provento_receber: valor_provento_receber,
        valor_saldo: valor_saldo,
        valor_total_aportado: valor_total_aportado,
        valor_total_papel: valor_total_papel,
        varia_valor_papel: varia_valor_papel,
        estrategia: estrategia,
        valor_acao: valor_acao,
      );
}
