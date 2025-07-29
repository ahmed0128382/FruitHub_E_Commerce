import 'package:flutter_dotenv/flutter_dotenv.dart';

const kisOnBoardingViewSeen = 'isOnBoardingViewSeen';
const kHorizontalPadding = 16.0;
const kTopPadding = 16.0;
const kUserData = 'userData';

String get paypalClientId => dotenv.env['PAYPAL_CLIENT_ID'] ?? '';
String get paypalSecretKey => dotenv.env['PAYPAL_SECRET_KEY'] ?? '';
