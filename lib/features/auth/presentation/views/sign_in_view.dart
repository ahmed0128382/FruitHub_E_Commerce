import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/sign_in_view_body_bloc_consumer.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: 'تسجيل دخول',
        ),
        body: SignInViewBodyBlocConsumer(),
      ),
    );
  }
}
