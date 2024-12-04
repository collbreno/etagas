import 'package:flutter/material.dart';

class FuelPriceInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const FuelPriceInput({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
        keyboardType: const TextInputType.numberWithOptions(
          signed: false,
          decimal: false,
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) =>
            double.tryParse(value!) == null ? 'Valor inválido' : null,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
        controller: controller,
      ),
    );
  }
}
