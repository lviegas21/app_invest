import 'package:bolsa_valores/ui/home/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerComponents extends StatelessWidget {
  const DrawerComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<HomePresenter>();
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Drawer(
      backgroundColor: colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Column(
        children: [
          _buildHeader(presenter, colorScheme, textTheme),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(
                  context: context,
                  icon: Icons.payment_rounded,
                  title: 'Pagamentos',
                  onTap: () => Get.toNamed("/pagamento", arguments: presenter.uid),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.add_chart_rounded,
                  title: 'Cadastro de Investimento',
                  onTap: () => Get.toNamed("/perfil", arguments: presenter.uid),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.info_outline_rounded,
                  title: 'Sobre',
                  onTap: () => Get.toNamed("/sobre"),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: FilledButton.tonal(
              onPressed: () {
                Get.offAllNamed('/login');
              },
              style: FilledButton.styleFrom(
                backgroundColor: colorScheme.errorContainer,
                foregroundColor: colorScheme.error,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout_rounded, size: 20),
                  SizedBox(width: 8),
                  Text('Sair'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(
    HomePresenter presenter,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 48, 16, 16),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(32),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: colorScheme.primary,
              shape: BoxShape.circle,
              border: Border.all(
                color: colorScheme.surface,
                width: 3,
              ),
            ),
            child: Icon(
              Icons.person_rounded,
              size: 40,
              color: colorScheme.onPrimary,
            ),
          ),
          SizedBox(height: 16),
          Text(
            presenter.params.email ?? 'Usuário',
            style: textTheme.titleMedium?.copyWith(
              color: colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        leading: Icon(
          icon,
          color: colorScheme.primary,
          size: 24,
        ),
        title: Text(
          title,
          style: textTheme.titleSmall?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w500,
          ),
        ),
        minLeadingWidth: 0,
        horizontalTitleGap: 12,
      ),
    );
  }
}
