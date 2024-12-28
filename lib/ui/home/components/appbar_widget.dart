import 'package:bolsa_valores/ui/home/home.dart';
import 'package:bolsa_valores/util/enum_meses.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar appBarWidget(
  BuildContext context,
  List? meses,
  Rx<String>? selectedMonth,
) {
  final presenter = Get.find<HomePresenter>();
  final colorScheme = Theme.of(context).colorScheme;
  final textTheme = Theme.of(context).textTheme;

  return AppBar(
    backgroundColor: colorScheme.surface,
    scrolledUnderElevation: 0,
    title: Row(
      children: [
        Icon(
          Icons.account_balance,
          color: colorScheme.primary,
          size: 28,
        ),
        SizedBox(width: 12),
        Text(
          'Invest App',
          style: textTheme.titleLarge?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    actions: <Widget>[
      Container(
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: IconButton(
          icon: Icon(Icons.calendar_month_rounded),
          color: colorScheme.primary,
          onPressed: () => _showDateSelectionModal(context, presenter, meses),
        ),
      ),
    ],
  );
}

void _showDateSelectionModal(
  BuildContext context,
  HomePresenter presenter,
  List? meses,
) {
  final colorScheme = Theme.of(context).colorScheme;
  final textTheme = Theme.of(context).textTheme;

  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Obx(
        () => Container(
          margin: EdgeInsets.fromLTRB(16, 8, 16, 32),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 10,
                offset: Offset(0, -5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 8),
                  width: 32,
                  height: 4,
                  decoration: BoxDecoration(
                    color: colorScheme.outlineVariant,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selecione o período',
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Escolha o mês e ano para visualizar os investimentos',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: _buildDropdown(
                            context: context,
                            value: presenter.selectedMonth.value,
                            items: meses!.map<DropdownMenuItem<String>>(
                              (dynamic value) {
                                return DropdownMenuItem<String>(
                                  value: value["descricao"],
                                  child: Text(value["descricao"]),
                                );
                              },
                            ).toList(),
                            onChanged: (value) {
                              presenter.selectedMonth.value = value!;
                              var id = meses.firstWhere(
                                  (e) => value == e["descricao"]);
                              presenter.controllerMes.value.text = id["id"];
                            },
                            hint: 'Mês',
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: _buildDropdown(
                            context: context,
                            value: presenter.controllerAno.value,
                            items: List<DropdownMenuItem<int>>.generate(
                              10,
                              (index) {
                                final year =
                                    DateTime.now().year - 5 + index;
                                return DropdownMenuItem<int>(
                                  value: year,
                                  child: Text(year.toString()),
                                );
                              },
                            ),
                            onChanged: (value) {
                              presenter.controllerAno.value = value!;
                            },
                            hint: 'Ano',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    FilledButton(
                      onPressed: () {
                        presenter.loadFinancaMes();
                        Navigator.pop(context);
                      },
                      child: Text('Confirmar'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildDropdown<T>({
  required BuildContext context,
  required T value,
  required List<DropdownMenuItem<T>> items,
  required ValueChanged<T?> onChanged,
  required String hint,
}) {
  final colorScheme = Theme.of(context).colorScheme;
  final textTheme = Theme.of(context).textTheme;

  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: colorScheme.surfaceVariant.withOpacity(0.5),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: colorScheme.outline),
    ),
    child: DropdownButton<T>(
      value: value,
      items: items,
      onChanged: onChanged,
      hint: Text(
        hint,
        style: textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      style: textTheme.bodyLarge?.copyWith(
        color: colorScheme.onSurface,
      ),
      icon: Icon(
        Icons.arrow_drop_down_rounded,
        color: colorScheme.onSurfaceVariant,
      ),
      underline: SizedBox(),
      isExpanded: true,
      borderRadius: BorderRadius.circular(12),
    ),
  );
}
