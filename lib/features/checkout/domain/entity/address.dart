class Address {
  final String name;
  final String phone;
  final String streetAddress;
  final String city;
  final String state;
  final String zipCode;
  final double? latitude;
  final double? longitude;

  Address({
    required this.name,
    required this.phone,
    required this.streetAddress,
    required this.city,
    required this.state,
    required this.zipCode,
    this.latitude,
    this.longitude,
  });
}
