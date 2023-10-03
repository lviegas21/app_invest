import 'package:bolsa_valores/domain/entities/entities.dart';
import 'package:get/get.dart';

abstract class PagamentoPresenter {
  RxString get payload;
  RxBool get isClickPix;
  RxBool get isClickBoleto;
  Rx<PagamentoEntity> get pagamento;
  Future<dynamic> loadPix();
  Future<dynamic> loadBoleto();
}
