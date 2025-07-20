import 'package:fruit_hub/core/entities/product_entity.dart';

getDummyProduct() => ProductEntity(
      code: 'apple',
      name: 'Apple',
      price: 100,
      isFeatured: true,
      description: 'A red apple',
      imageUrl:
          'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      reviews: [],
      expirationMonths: 100,
      noOfCalories: 100,
      unitAmount: 1,
    );

List<ProductEntity> getDummyProducts({required int count}) =>
    List.generate(count, (index) => getDummyProduct());
