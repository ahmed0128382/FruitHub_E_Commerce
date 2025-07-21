import 'dart:convert';

import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';

UserEntity getUser() {
  final jsonString = PrefS.getString(kUserData);

  if (jsonString == null || jsonString.trim().isEmpty) {
    throw Exception("No user data found in SharedPreferences");
  }

  try {
    return UserModel.fromJson(jsonDecode(jsonString));
  } catch (e) {
    throw Exception("Failed to decode user data: $e");
  }
}
