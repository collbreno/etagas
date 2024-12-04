import 'package:flutter/material.dart';

enum Fuel {
  ethanol('Etanol'),
  gasoline('Gasolina');

  final String text;
  const Fuel(this.text);

  Color get color {
    return switch (this) {
      Fuel.ethanol => Colors.green.shade800,
      Fuel.gasoline => Colors.red.shade800,
    };
  }
}
