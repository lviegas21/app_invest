import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login_presenter.dart';

class LoginButton extends StatelessWidget {
  final double horizontalPadding;
  const LoginButton({super.key, required this.horizontalPadding});

  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<LoginPresenter>();
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: FilledButton(
            onPressed: presenter.isValid.value ? presenter.loadLogin : null,
            style: FilledButton.styleFrom(
              backgroundColor: presenter.isValid.value
                  ? colorScheme.primary
                  : colorScheme.surfaceVariant,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: presenter.isValid.value ? 2 : 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (presenter.isLoading.value ?? false) ...[
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        colorScheme.onPrimary,
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                ],
                Text(
                  presenter.isLoading?.value ?? false
                      ? 'ENTRANDO...'
                      : 'ENTRAR',
                  style: textTheme.titleMedium?.copyWith(
                    color: presenter.isValid.value
                        ? colorScheme.onPrimary
                        : colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                if (presenter.isValid.value &&
                    !(presenter.isLoading?.value ?? false)) ...[
                  SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward,
                    color: colorScheme.onPrimary,
                    size: 20,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
