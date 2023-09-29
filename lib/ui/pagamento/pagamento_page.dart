import 'package:bolsa_valores/ui/home/components/appbar_widget.dart';
import 'package:bolsa_valores/ui/pagamento/pagamento_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PagamentoPage extends StatelessWidget {
  final PagamentoPresenter presenter;
  PagamentoPage({super.key, required this.presenter});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Pagamentos',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 32),
              Text(
                'Como você deseja pagar?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // Implemente a lógica para prosseguir com o pagamento via Pix
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 64, vertical: 20),
                  textStyle: TextStyle(fontSize: 20),
                ),
                child: Text(
                  'Pix',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Implemente a lógica para prosseguir com o pagamento via Boleto
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 64, vertical: 20),
                  textStyle: TextStyle(fontSize: 20),
                ),
                child: Text(
                  'Boleto',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 32),
              Text(
                'Você escolheu pagar via .',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              QrImageView(
                data: presenter.payload.toString(),
                version: QrVersions.auto,
                size: 200.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
