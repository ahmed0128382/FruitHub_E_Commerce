import 'package:fruit_hub/features/checkout/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? email;
  String? name;
  String? city;
  String? phoneNumber;
  String? address;
  String? addressDetails;

  ShippingAddressModel(
      {this.email,
      this.name,
      this.city,
      this.phoneNumber,
      this.address,
      this.addressDetails});
  factory ShippingAddressModel.fromEntity(
      ShippingAddressEntity shippingAddressEntity) {
    return ShippingAddressModel(
      email: shippingAddressEntity.email,
      name: shippingAddressEntity.name,
      city: shippingAddressEntity.city,
      phoneNumber: shippingAddressEntity.phoneNumber,
      address: shippingAddressEntity.address,
      addressDetails: shippingAddressEntity.addressDetails,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'city': city,
      'phoneNumber': phoneNumber,
      'address': address,
      'addressDetails': addressDetails,
    };
  }

  @override
  String toString() {
    return '$city,$addressDetails,$address';
  }
}
