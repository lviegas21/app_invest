import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecase/usecase.dart';
import '../models/models.dart';

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
