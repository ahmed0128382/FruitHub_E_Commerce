import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helper/build_error_bar.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub/features/auth/presentation/views/sign_in_view.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key, required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar + Name + Email
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  const AssetImage('assets/images/user_avatar.jpg'),
            ),
            const SizedBox(height: 16),
            Text(
              user.name,
              style: AppStyles.bold16.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 4),
            Text(
              user.email,
              style: AppStyles.regular13.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(height: 32),

            // Action List
            Expanded(
              child: ListView(
                children: [
                  _buildProfileTile(
                    context,
                    icon: Icons.edit,
                    text: 'تعديل الملف الشخصي',
                    onTap: () {
                      // Navigate to edit
                    },
                  ),
                  _buildProfileTile(
                    context,
                    icon: Icons.settings,
                    text: 'الإعدادات',
                    onTap: () {
                      // Navigate to settings
                    },
                  ),
                  _buildProfileTile(
                    context,
                    icon: Icons.logout,
                    text: 'تسجيل الخروج',
                    iconColor: Colors.red,
                    textColor: Colors.red,
                    onTap: () => _showLogoutDialog(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileTile(
    BuildContext context, {
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    Color? iconColor,
    Color? textColor,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: iconColor ?? AppColors.lightprimaryColor),
        title: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: textColor ?? Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
      ),
    );
  }

  Future<void> _showLogoutDialog(BuildContext context) async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('تأكيد تسجيل الخروج'),
        content: const Text('هل أنت متأكد أنك تريد تسجيل الخروج؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('تسجيل الخروج'),
          ),
        ],
      ),
    );

    if (shouldLogout == true) {
      try {
        await getIt<FirebaseAuthService>().signOut();
        PrefS.clear();
        Navigator.pushReplacementNamed(context, SignInView.routeName);
      } catch (e) {
        buildErrorBar(context, 'لقد حدث خطأ في تسجيل الخروج');
      }
    }
  }
}
