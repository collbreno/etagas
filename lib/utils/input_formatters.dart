import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

abstract class InputFormatters {
  static final priceFormatter = MaskTextInputFormatter(mask: '#.##');
}
