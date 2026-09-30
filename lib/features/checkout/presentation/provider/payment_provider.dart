import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentMethodNotifier extends Notifier<String> {
  @override
  String build() {
    return 'Debit / Credit Card';
  }

  void selectPaymentMethod(String method) {
    state = method;
  }
}

final paymentMethodProvider = NotifierProvider<PaymentMethodNotifier, String>(
  PaymentMethodNotifier.new,
);
