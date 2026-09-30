import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tradly/features/checkout/domain/entity/address.dart';

class AddressNotifier extends Notifier<Address?> {
  @override
  Address? build() {
    return null;
  }

  void addAddress(Address address) {
    state = address;
  }

  void clearAddress() {
    state = null;
  }
}

final addressProvider = NotifierProvider<AddressNotifier, Address?>(
  AddressNotifier.new,
);
