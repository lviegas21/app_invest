abstract class QueryResultInvestimento {
  Future<dynamic> loadDetalheInvestimentoData(String data, String uid);
  Future<dynamic> loadVerificaUltimoPagamento(String uid);
}
