import 'package:bolsa_valores/ui/pagamento/pagamento_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';

class PagamentoPage extends StatelessWidget {
  final PagamentoPresenter presenter;
  PagamentoPage({super.key, required this.presenter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 10),
              const Text(
                'Escolha a forma de pagamento:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  presenter.isClickBoleto.value = false;
                  presenter.isClickPix.value = true;
                  presenter.loadPix();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Cor de fundo
                  onPrimary: Colors.white, // Cor do texto
                  elevation: 5, // Elevação do botão
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8.0), // Borda arredondada
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Pix',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  presenter.isClickPix.value = false;
                  presenter.isClickBoleto.value = true;
                  presenter.loadBoleto();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Cor de fundo
                  onPrimary: Colors.white, // Cor do texto
                  elevation: 5, // Elevação do botão
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8.0), // Borda arredondada
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Boleto',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 50),
              presenter.isClickPix.value
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'QR Code para pagamento Pix:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18, // Tamanho da fonte do título
                            ),
                          ),
                          SizedBox(
                            height:
                                16, // Adicionar espaçamento abaixo do título
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white, // Cor de fundo do container
                              borderRadius: BorderRadius.circular(
                                  10.0), // Borda arredondada
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(
                                12.0), // Espaçamento interno do container
                            child: Column(
                              children: [
                                QrImageView(
                                  data: presenter.payload.toString(),
                                  version: QrVersions.auto,
                                  size: 200.0,
                                ),
                                SizedBox(
                                    height:
                                        16), // Adicionar espaçamento abaixo do QR Code
                                ElevatedButton(
                                  onPressed: () {
                                    Clipboard.setData(ClipboardData(
                                        text: presenter.payload.toString()));
                                    final snackBar = SnackBar(
                                        content: Text(
                                            'Valor PIX copiado para a área de transferência'));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  },
                                  child: Text('Copiar Valor PIX'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : presenter.isClickBoleto.value
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Código de Boleto:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18, // Tamanho da fonte do título
                                ),
                              ),
                              SizedBox(
                                  height:
                                      16), // Adicionar espaçamento abaixo do título
                              Container(
                                decoration: BoxDecoration(
                                  color:
                                      Colors.white, // Cor de fundo do container
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Borda arredondada
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.all(
                                    12.0), // Espaçamento interno do container
                                child: Column(
                                  children: [
                                    Text(
                                      presenter.pagamento.value.cod_boleto
                                          .toString(),
                                      style: TextStyle(
                                        fontSize:
                                            20, // Tamanho da fonte do código
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign
                                          .center, // Para alinhar à direita, por exemplo
                                    ),
                                    SizedBox(
                                        height:
                                            16), // Espaçamento abaixo do código
                                    ElevatedButton(
                                      onPressed: () {
                                        Clipboard.setData(ClipboardData(
                                            text: presenter
                                                .pagamento.value.cod_boleto
                                                .toString()));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Código de Boleto copiado!'),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors
                                            .orange, // Cor de fundo do botão
                                        onPrimary: Colors
                                            .white, // Cor do texto do botão
                                        elevation: 5, // Elevação do botão
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              8.0), // Borda arredondada do botão
                                        ),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            12.0), // Espaçamento interno do botão
                                        child: Text(
                                          'Copiar Código de Boleto',
                                          style: TextStyle(
                                            fontSize:
                                                18, // Tamanho da fonte do texto do botão
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
