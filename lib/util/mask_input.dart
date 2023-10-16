import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

final maskCpfUser = MaskTextInputFormatter(
    mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});
final maskDataNascimento =
    MaskTextInputFormatter(mask: "##/##/####", filter: {"#": RegExp(r'[0-9]')});
