import 'package:bolsa_valores/domain/usecase/usecase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RemoteQueryInvestimentoUsecase implements QueryResultInvestimento {
  @override
  Future loadDetalheInvestimentoData(String data, String uid) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      final response = firestore.collection("investimentos").get().then(
        (querySnapshot) {
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs) {
            print('${docSnapshot.id} => ${docSnapshot.data()}');
          }
        },
        onError: (e) => print("Error completing: $e"),
      );
      return response;
    } catch (e) {}
  }
}
