import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper/build_error_bar.dart';
import 'package:fruit_hub/core/widgets/custom_progress_hud.dart';
import 'package:fruit_hub/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/sign_in_view_body.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          //Navigator.of(context).pushReplacementNamed(SignIn.routeName);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('تم تسجيل الدخول بنجاح')),
          );
        }
        if (state is SignInFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SignInLoading ? true : false,
          child: const SignInViewBody(),
        );
      },
    );
  }
}
