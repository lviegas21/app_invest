import 'package:bolsa_valores/data/models/models.dart';
import 'package:bolsa_valores/domain/entities/entities.dart';
import 'package:bolsa_valores/domain/usecase/usecase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RemotePagamentoUsecase implements QueryConsultaPay {
  @override
  Future loadConsultaPay(String uid) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      final response = await firestore.collection("pagamento").get().then(
        (querySnapshot) {
          for (var docSnapshot in querySnapshot.docs) {
            print('aq ${uid} e ${docSnapshot.id} => ${docSnapshot.data()}');
            if (uid == docSnapshot.data()["usuario_referencia"]) {
              Map<dynamic, dynamic> jsonData =
                  docSnapshot.data() as Map<dynamic, dynamic>;
              print(jsonData);
              return PagamentoModels.fromJson(jsonData).toEntity();
            }
          }
        },
        onError: (e) => print("Error completing: $e"),
      );
      return response ?? PagamentoEntity();
    } catch (e) {}
  }
}
