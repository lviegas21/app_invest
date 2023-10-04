// ignore_for_file: avoid_print, unnecessary_cast

import 'dart:convert';

import 'package:bolsa_valores/data/models/investimento_models.dart';
import 'package:bolsa_valores/domain/entities/investimento_entity.dart';
import 'package:bolsa_valores/domain/usecase/usecase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/pagamento_models.dart';

class RemoteQueryInvestimentoUsecase implements QueryResultInvestimento {
  @override
  Future<dynamic> loadDetalheInvestimentoData(String data, String uid) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      final response = await firestore.collection("investimentos").get().then(
        (querySnapshot) {
          print("Successfully completed");

          for (var docSnapshot in querySnapshot.docs) {
            print('aq ${uid} e ${docSnapshot.id} => ${docSnapshot.data()}');
            if (uid == docSnapshot.data()["referencia_usuario"]) {
              final data_front = data.split("/");
              final data_banco = docSnapshot.data()["data_detalhe"].split('/');
              if (data_front.first == data_banco[1] && data_banco.last == data_front.last) {
                Map<dynamic, dynamic> jsonData = docSnapshot.data() as Map<dynamic, dynamic>;
                print(jsonData);
                return InvestimentoModels.fromJson(jsonData).toEntity();
              }
            }
          }
        },
        onError: (e) => print("Error completing: $e"),
      );
      return response ?? InvestimentoEntity();
    } catch (e) {}
  }

  @override
  Future loadVerificaUltimoPagamento(String uid) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      final response = await firestore.collection("pagamento").orderBy('data_pagamento', descending: true).get().then(
        (querySnapshot) {
          print("Successfully completed");
          List? pessoa = [];

          for (var docSnapshot in querySnapshot.docs) {
            print('aq ${uid} e ${docSnapshot.id} => ${docSnapshot.data()}');
            if (uid == docSnapshot.data()["usuario_referencia"]) {
              Map<dynamic, dynamic> jsonData = docSnapshot.data() as Map<dynamic, dynamic>;
              print(jsonData);
              pessoa.add(jsonData);
            }
          }
          return pessoa.isEmpty ? null : PagamentoModels.fromJson(pessoa.last).toEntity();
        },
        onError: (e) => print("Error completing: $e"),
      );
      return response ?? InvestimentoEntity();
    } catch (e) {}
  }
}


//cod_boleto
//data_pagamento
//isPagou
//usuario_referencia