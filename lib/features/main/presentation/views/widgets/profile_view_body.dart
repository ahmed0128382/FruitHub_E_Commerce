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
    final List<_ActionButtonData> actions = [
      _ActionButtonData(
        text: 'تعديل الملف الشخصي',
        color: AppColors.lightprimaryColor,
        onPressed: () {
          // Navigator.push(...);
        },
      ),
      _ActionButtonData(
        text: 'الإعدادات',
        color: AppColors.lightprimaryColor,
        onPressed: () {
          // Navigator.push(...);
        },
      ),
      _ActionButtonData(
        text: 'تسجيل الخروج',
        color: Colors.red,
        onPressed: () async {
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
        },
      ),
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage:
                    const AssetImage('assets/images/user_avatar.jpg'),
              ),
              const SizedBox(height: 16),
              Text(
                user.name,
                style: AppStyles.bold16.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 4),
              Text(
                user.email,
                style: AppStyles.regular13.copyWith(color: Colors.grey[600]),
              ),
              const SizedBox(height: 24),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: actions.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) => _buildActionButton(
                  context,
                  text: actions[index].text,
                  color: actions[index].color,
                  onPressed: actions[index].onPressed,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context,
      {required String text,
      required Color color,
      required VoidCallback onPressed}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

class _ActionButtonData {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  _ActionButtonData({
    required this.text,
    required this.color,
    required this.onPressed,
  });
}
