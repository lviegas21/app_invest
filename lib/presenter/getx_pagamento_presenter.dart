import 'package:bolsa_valores/ui/pagamento/pagamento_presenter.dart';
import 'package:get/get.dart';
import 'package:pix_flutter/pix_flutter.dart';

class GetxPagamentoPresenter extends GetxController
    implements PagamentoPresenter {
  @override
  void onInit() async {
    payload = await loadPayload();
    print(payload);
    super.onInit();
  }

  @override
  RxString payload = ''.obs;

  @override
  Future<dynamic> loadPayload() async {
    PixFlutter pixFlutter = PixFlutter(
        payload: Payload(
            pixKey: '619.815.353-30',
            // A descrição está desativada por um erro no próprio API Pix, que não deixa processar pagamentos se ela estiver presente.
            // Assim que o bug for consertado, a funcionalidade será adicionada de volta.
            description: 'pagamento mensal',
            merchantName: 'Lucas Ferreira Viegas',
            merchantCity: 'São Luis',
            // Até 25 caracteres para o QR Code estático
            amount: '100'));

    return await pixFlutter.getQRCode();
  }
}
