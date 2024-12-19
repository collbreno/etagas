import 'package:etagas/enums/fuel.dart';
import 'package:etagas/utils/constants.dart';

class CalculatorService {
  Fuel getBestValue({
    required double ethanolPrice,
    required double gasolinePrice,
  }) {
    return gasolinePrice * kFuelFactor < ethanolPrice
        ? Fuel.gasoline
        : Fuel.ethanol;
  }
}
