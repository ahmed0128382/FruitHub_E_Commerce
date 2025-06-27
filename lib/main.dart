import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helper/on_generate_route.dart';
import 'package:fruit_hub/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const FruitCommerceApp());
}

// ignore: camel_case_types
class FruitCommerceApp extends StatelessWidget {
  const FruitCommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
