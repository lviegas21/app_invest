// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login_presenter.dart';

class EmailComponents extends StatelessWidget {
  const EmailComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<LoginPresenter>();

    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: TextField(
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          controller: presenter.cpfController.value,
          cursorColor: const Color(0xFF0F192C),
          style: const TextStyle(color: Color(0xFF0F192C), fontSize: 18),
          onChanged: presenter.validate,
          decoration: InputDecoration(
            fillColor: Color.fromARGB(179, 219, 216, 216),
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)),
            labelStyle: const TextStyle(color: Color(0xFF0F192C)),
            prefixIcon: const Icon(Icons.person, color: Color(0xFF0F192C)),
            hintText: "Email",
            //errorText: presenter.cpfError.value?.isEmpty == true
            //? null
            // : presenter.cpfError.value,
          ),
        ),
      ),
    );
  }
}
