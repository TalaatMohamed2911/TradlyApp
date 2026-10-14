import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tradly/core/di/di.dart';
import 'package:tradly/features/checkout/data/data_source/stripe_payment_data_source.dart';
import 'package:tradly/features/checkout/stripe_payment/payment_manager.dart';

enum PaymentStatus { idle, loading, success, cancelled, error }

class StripePaymentNotifier extends Notifier<PaymentStatus> {
  final StripePaymentDataSource _dataSource;

  StripePaymentNotifier(this._dataSource);

  @override
  PaymentStatus build() => PaymentStatus.idle;

  Future<void> pay(int amount, String currency) async {
    state = PaymentStatus.loading;

    try {
      final clientSecret = await _dataSource.createPaymentIntent(
        amount: amount * 100,
        currency: currency,
      );

      await PaymentManager.makePayment(clientSecret);

      state = PaymentStatus.success;
    } catch (_) {
      state = PaymentStatus.error;
    }
  }

  void reset() {
    state = PaymentStatus.idle;
  }
}

final stripePaymentProvider =
    NotifierProvider<StripePaymentNotifier, PaymentStatus>(
      () => StripePaymentNotifier(instance<StripePaymentDataSource>()),
    );
