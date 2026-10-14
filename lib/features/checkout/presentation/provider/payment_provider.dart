import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentMethodNotifier extends Notifier<String?> {
  @override
  String? build() => null;

  void selectPaymentMethod(String method) {
    state = method;
  }

  void clearPaymentMethod() {
    state = null;
  }
}

final paymentMethodProvider = NotifierProvider<PaymentMethodNotifier, String?>(
  PaymentMethodNotifier.new,
);
