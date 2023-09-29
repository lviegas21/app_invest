// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class InvestimentoEntity extends Equatable {
  final String? acao;
  final String? varia_valor_papel;
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
  final String? estrategia;
  final String? valor_acao;
  final String? rendimento;

  const InvestimentoEntity({
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
    this.rendimento,
  });

  @override
  List get props => [
        acao,
        ano_aportado,
        ano_provento,
        data_detalhe,
        data_operacao,
        data_saldo,
        ganho_percentual,
        ganho_real,
        poupanca,
        qtd_papel,
        referencia_usuario,
        saldo_provento,
        valor_capital_aportado,
        valor_operacao,
        valor_provento_receber,
        valor_saldo,
        valor_total_aportado,
        valor_total_papel,
        varia_valor_papel,
        estrategia,
        valor_acao,
        rendimento,
      ];
}
