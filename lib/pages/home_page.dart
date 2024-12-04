import 'package:etagas/enums/fuel.dart';
import 'package:etagas/services/calculator_service.dart';
import 'package:etagas/widgets/fuel_price_input.dart';
import 'package:etagas/widgets/fuel_chip.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _gasolineController;
  late final TextEditingController _ethanolController;
  late Fuel? _bestValue;
  late final CalculatorService _service;

  @override
  void initState() {
    _gasolineController = TextEditingController()..addListener(_calculate);
    _ethanolController = TextEditingController()..addListener(_calculate);
    _service = CalculatorService();
    _bestValue = null;
    super.initState();
  }

  @override
  void dispose() {
    _gasolineController.dispose();
    _ethanolController.dispose();
    super.dispose();
  }

  void _calculate() {
    final gasolinePrice = double.tryParse(_gasolineController.text);
    final ethanolPrice = double.tryParse(_ethanolController.text);
    if (gasolinePrice != null && ethanolPrice != null) {
      setState(() {
        _bestValue = _service.getBestValue(
          ethanolPrice: ethanolPrice,
          gasolinePrice: gasolinePrice,
        );
      });
    }
  }

  Widget _buildResult() {
    final gasolinePrice = double.parse(_gasolineController.text);
    final ethanolPrice = double.parse(_ethanolController.text);
    final gasolineConvertedPrice = gasolinePrice * 0.75;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Text(
          'Você deve abastecer com:',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 8),
        FuelChip(gas: _bestValue!),
        const SizedBox(height: 8),
        Row(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Preço da Gasolina:'),
                Text('Preço do Etanol:'),
                Text('Preço ajustado:'),
              ],
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  gasolinePrice.toStringAsFixed(2),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Fuel.gasoline.color,
                  ),
                ),
                Text(
                  ethanolPrice.toStringAsFixed(2),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Fuel.ethanol.color,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: [
                      TextSpan(
                        text: gasolineConvertedPrice.toStringAsFixed(2),
                        style: TextStyle(
                            color: Fuel.gasoline.color,
                            fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(text: ' x '),
                      TextSpan(
                        text: ethanolPrice.toStringAsFixed(2),
                        style: TextStyle(
                            color: Fuel.ethanol.color,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          Text(
            'Insira o preço dos combustíveis:',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: FuelPriceInput(
                  controller: _gasolineController,
                  label: 'Gasolina',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: FuelPriceInput(
                  label: 'Etanol',
                  controller: _ethanolController,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (_bestValue != null) _buildResult()
        ],
      ),
    );
  }
}
