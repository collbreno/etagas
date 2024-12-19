import 'package:etagas/utils/input_formatters.dart';
import 'package:flutter/material.dart';

class FuelPriceInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final VoidCallback? onSubmitted;
  final FocusNode focusNode;
  const FuelPriceInput({
    super.key,
    required this.label,
    required this.controller,
    this.onSubmitted,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
        focusNode: focusNode,
        inputFormatters: [InputFormatters.priceFormatter],
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
        onFieldSubmitted: (_) {
          onSubmitted?.call();
        },
      ),
    );
  }
}
