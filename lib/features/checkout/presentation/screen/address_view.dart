import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:tradly/features/checkout/domain/entity/address.dart';
import 'package:tradly/features/checkout/presentation/provider/address_provider.dart';
import 'package:tradly/features/checkout/presentation/provider/location_provider.dart';

class AddAddressScreen extends ConsumerStatefulWidget {
  const AddAddressScreen({super.key});

  @override
  ConsumerState<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends ConsumerState<AddAddressScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final streetAddressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipCodeController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    streetAddressController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipCodeController.dispose();

    super.dispose();
  }

  Future<void> getCurrentLocation() async {
    final position = await ref.read(locationProvider.future);

    if (position == null) {
      return;
    }

    final placemarks = await Geocoding().placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isEmpty) {
      return;
    }

    final place = placemarks.first;

    nameController.text = place.street ?? '';
    phoneController.text = place.name ?? '';
    streetAddressController.text = place.administrativeArea ?? '';
    cityController.text = place.locality ?? '';
    stateController.text = place.isoCountryCode ?? '';
    zipCodeController.text = place.postalCode ?? '';
  }

  void saveAddress() {
    final address = Address(
      name: nameController.text.trim(),
      phone: phoneController.text.trim(),
      streetAddress: stateController.text.trim(),
      city: cityController.text.trim(),
      state: stateController.text.trim(),
      zipCode: zipCodeController.text.trim(),
    );

    ref.read(addressProvider.notifier).addAddress(address);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Address')),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            OutlinedButton.icon(
              onPressed: getCurrentLocation,
              icon: const Icon(Icons.my_location),
              label: const Text('Use Current Location'),
            ),

            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(labelText: 'Phone'),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: streetAddressController,
              decoration: const InputDecoration(labelText: 'Street Address'),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: cityController,
              decoration: const InputDecoration(labelText: 'City'),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: stateController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'State'),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: zipCodeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Zipcode'),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveAddress,
                child: const Text('Save Address'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
