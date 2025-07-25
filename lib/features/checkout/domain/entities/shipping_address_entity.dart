class ShippingAddressEntity {
  final String email;
  final String name;
  final String city;
  final String phoneNumber;
  final String address;
  final String addressDetails;

  ShippingAddressEntity(
      {required this.email,
      required this.name,
      required this.city,
      required this.phoneNumber,
      required this.address,
      required this.addressDetails});
}
