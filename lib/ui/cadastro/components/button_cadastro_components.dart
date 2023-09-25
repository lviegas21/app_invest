import 'package:bolsa_valores/ui/cadastro/cadastro_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CadastroComponentsButton extends StatelessWidget {
  final double horizontalPadding;
  const CadastroComponentsButton({Key? key, required this.horizontalPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<CadastroPresenter>();
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: ElevatedButton(
          onPressed: () => presenter.loadCadastro(),

          // onPressed: presenter.isFormValid.value == true
          //     ? () async {
          //         FocusManager.instance.primaryFocus?.unfocus();
          //         presenter.isFormValid.value == true ? await presenter.auth() : null;
          //         //handleMainError(presenter.mainError, context);
          //         if (presenter.mainError.value == null && presenter.userEntity != null) {
          //           // handleNavigation(presenter.navigateToStream, clear: true);
          //           Get.offAllNamed('/home', arguments: presenter.userEntity);
          //         }
          //       }
          //     : null,
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(10),
            minimumSize: MaterialStateProperty.all(Size.zero),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.grey
                // AppColor.secondaryColor,
                ), //presenter.isFormValid.value == true ? const Color(0xFF0F192C) : Colors.white24.withOpacity(0.2)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                side: BorderSide(
                    color: Colors
                        .white24), //presenter.isFormValid.value == true ? Colors.white : Colors.white24),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  margin: const EdgeInsets.only(left: 0),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color:
                          presenter.isValid.value ? Colors.black : Colors.grey),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      "Cadastrar",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: presenter.isValid.value
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
