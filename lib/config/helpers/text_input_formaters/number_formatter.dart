import 'package:flutter/services.dart';

class NumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String value = newValue.text;

    // Eliminar caracteres no permitidos
    value = value.replaceAll(RegExp(r'[^\d.]'), '');

    // Permitir solo un punto decimal
    int pointIndex = value.indexOf('.');
    if (pointIndex >= 0) {
      value = value.substring(0, pointIndex + 1) +
          value.substring(pointIndex + 1).replaceAll('.', '');
    }

    // Restringir la cantidad máxima de dígitos después del punto decimal a tres
    if (pointIndex >= 0 && value.substring(pointIndex + 1).length > 3) {
      value = value.substring(0, pointIndex + 4);
    }

    return TextEditingValue(
      text: value,
      selection: TextSelection.collapsed(offset: value.length),
    );
  }
}
