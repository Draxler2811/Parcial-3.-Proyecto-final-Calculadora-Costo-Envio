import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:calculado_a_costo_envio/utils/input_formatters.dart';


class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final TextInputType keyboardType;

  const InputField({
    Key? key,
    required this.controller,
    required this.placeholder,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      placeholder: placeholder,
      keyboardType: keyboardType,
      inputFormatters: keyboardType == TextInputType.numberWithOptions(decimal: true)
          ? [decimalInputFormatter]
          : null,
    );
  }
}