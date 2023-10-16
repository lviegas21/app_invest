import 'package:bolsa_valores/domain/usecase/query_inserindo_corretora.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RemoteQueryCorretoraUser implements QueryInserindoCorretora {
  @override
  Future loadDataCorretoraUser(String uid, String conta, String cpf,
      String nascimento, String assinatura) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      final response = firestore.collection("corretora").add({
        'referencia_user': uid,
        'conta': conta,
        'cpf': cpf,
        'nascimento': nascimento,
        'assinatura': assinatura,
      });
      print(response);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
