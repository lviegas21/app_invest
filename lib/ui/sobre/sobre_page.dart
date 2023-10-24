// ignore_for_file: prefer_const_constructors

import 'package:bolsa_valores/ui/sobre/sobre.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SobrePage extends StatelessWidget {
  final SobrePresenter presenter;
  SobrePage({required this.presenter});
  final List<Widget> items = [
    Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            "CAPACITAR INVESTIMENTOS",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Mentoria CI_MAIS - Rentabilidade com segurança."
              "Nossa mentoria tem o propósito de garantir que você não perca mais do seu capital nos seus investimentos na bolsa de valores. 100% de seu capital preservado. Rentabilidade garantida."
              "CI_MAIS - Rentabilidade com segurança"
              "Garanta a preservação do seu capital na Bolsa de Valores!"
              "Nossa mentoria é especializada em ensinar técnicas e estratégias comprovadas para investir na Bolsa de Valores com segurança, garantindo que você não perca mais nenhum centavo do seu capital."
              "Com a CI_MAIS, você terá 100% do seu capital preservado e ainda garantirá rentabilidade. Nossa equipe de especialistas irá te acompanhar de perto, ajudando a tomar as melhores decisões de investimento e maximizar seus lucros."
              "Não perca mais tempo e dinheiro tentando investir sozinho. Invista em você e na sua educação financeira com a mentoria CI_MAIS e conquiste a tão sonhada independência financeira."
              "Entre em contato conosco agora mesmo e agende sua mentoria!",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    ),
    Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const <Widget>[
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Estratégia CI_MAIS: Rentabilidade com segurança."
              "Operação 100% segura no mercado financeiro da bolsa de valores."
              "A CI_MAIS é uma estratégia comprovada e testada, que permite a você operar na bolsa de valores com 100% de segurança. Seu objetivo é maximizar os lucros e minimizar os riscos, tornando seus investimentos mais rentáveis e seguros? Com a CI_MAIS, você tem acesso a um método eficiente e simples de investir, baseado em análises precisas do mercado financeiro e técnicas avançadas de gestão de risco. Você poderá operar de forma tranquila e segura, sabendo que sua estratégia está alinhada com os melhores padrões de investimento."
              "A segurança também é uma prioridade para nós. A CI_MAIS adota técnicas avançadas de gestão de risco para proteger seu capital. Você pode investir com tranquilidade."
              "Não perca mais tempo e comece a investir com a CI_MAIS hoje mesmo. Entre em contato conosco para saber mais e comece a desfrutar dos benefícios de uma estratégia comprovada e segura no mercado financeiro da bolsa de valores.",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    ),
    Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset('assets/negocio.jpeg'),
          ),
        ],
      ),
    ),
    Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset('assets/operacao.jpeg'),
          ),
        ],
      ),
    ),
    Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset('assets/parcerias.jpeg'),
          ),
        ],
      ),
    ),
    Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset('assets/facilidades.jpeg'),
          )
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'Sobre',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: CarouselSlider(
        items: items,
        disableGesture: true,
        options: CarouselOptions(
          height: double.infinity,
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 1,
        ),
      ),
    );
  }
}
