import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/sign_in_view_body_bloc_consumer.dart';
import 'package:fruit_hub/features/on_boarding/presentation/views/on_boarding_view.dart';

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
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'تسجيل دخول',
            style: AppStyles.bold19,
          ),
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(OnBoardingView.routeName);
                ();
              },
              child: Icon(Icons.arrow_back_ios_new)),
        ),
        body: SignInViewBodyBlocConsumer(),
      ),
    );
  }
}
