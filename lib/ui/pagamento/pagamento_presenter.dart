import 'package:get/get.dart';

abstract class PagamentoPresenter {
  RxString get payload;
  Future<dynamic> loadPayload();
}
