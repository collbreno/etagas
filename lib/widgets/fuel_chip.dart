import 'package:etagas/enums/fuel.dart';
import 'package:flutter/material.dart';

class FuelChip extends StatelessWidget {
  final Fuel gas;
  const FuelChip({super.key, required this.gas});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: gas.color,
      ),
      padding: const EdgeInsets.all(16),
      alignment: Alignment.center,
      child: Text(
        gas.text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
      ),
    );
  }
}
