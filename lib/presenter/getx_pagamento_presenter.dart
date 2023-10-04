import 'package:bolsa_valores/domain/entities/pagamento_entity.dart';
import 'package:bolsa_valores/domain/usecase/usecase.dart';
import 'package:bolsa_valores/ui/pagamento/pagamento_presenter.dart';
import 'package:get/get.dart';
import 'package:pix_flutter/pix_flutter.dart';

class GetxPagamentoPresenter extends GetxController implements PagamentoPresenter {
  final QueryConsultaPay queryConsultaPay;
  dynamic uid = Get.arguments;

  GetxPagamentoPresenter({required this.queryConsultaPay});

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  RxString payload = ''.obs;

  @override
  var isClickPix = false.obs;

  @override
  var isClickBoleto = false.obs;

  @override
  Future<dynamic> loadPix() async {
    isClickPix.value = true;
    try {
      PixFlutter pixFlutter = PixFlutter(
        payload: Payload(
          pixKey: '61981535330',
          merchantName: 'Lucas Ferreira Viegas',
          merchantCity: 'Sao Luis',
          amount: '100.00',
          isUniquePayment: true,
          txid: '***',
        ),
      );

      payload.value = await pixFlutter.getQRCode();
      return payload;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<dynamic> loadBoleto() async {
    pagamento.value = await queryConsultaPay.loadConsultaPay(uid);
  }

  @override
  Rx<PagamentoEntity> pagamento = PagamentoEntity().obs;
}
