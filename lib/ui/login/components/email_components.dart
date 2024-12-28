// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login_presenter.dart';

class EmailComponents extends StatelessWidget {
  const EmailComponents({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<LoginPresenter>();
    final colorScheme = Theme.of(context).colorScheme;

    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: TextField(
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          controller: presenter.emailController.value,
          cursorColor: colorScheme.primary,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurface,
              ),
          onChanged: presenter.validate,
          decoration: InputDecoration(
            filled: true,
            fillColor: colorScheme.surfaceVariant.withOpacity(0.5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: colorScheme.outline),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: colorScheme.primary, width: 2),
            ),
            labelText: 'Email',
            labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
            prefixIcon: Icon(Icons.email, color: colorScheme.onSurfaceVariant),
          ),
        ),
      ),
    );
  }
}
