import 'package:etagas/enums/fuel.dart';

class CalculatorService {
  Fuel getBestValue({
    required double ethanolPrice,
    required double gasolinePrice,
  }) {
    return gasolinePrice * 0.75 < ethanolPrice ? Fuel.gasoline : Fuel.ethanol;
  }
}
