// ignore_for_file: use_key_in_widget_constructors
import 'package:dalel_app/core/functions/custom_toast.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/auth_state.dart';
import 'package:dalel_app/features/splach/presentation/widgets/custom_navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dalel_app/core/utils/app_string.dart';
import 'package:dalel_app/core/widgets/custom_button.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_text_field_widget.dart';

class CustomFormForgotPassword extends StatelessWidget {
  const CustomFormForgotPassword({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccessState) {
          showToast("Check Your Email to rest Password");
          customNavigate(context, '/signin');
        } else if (state is ForgotPasswordFieldState) {
          showToast(state.errorMessage);
        }
      },
      builder: (context, state) {
        return Form(
          key: BlocProvider.of<AuthCubit>(context).forgotPasswordFormKey,
          child: Column(
            children: [
              CustomTextFieldWidget(
                labelText: AppStrings.emailAddress,
                onChanged: (emailAddress) {
                  BlocProvider.of<AuthCubit>(context).emailAddress =
                      emailAddress;
                },
              ),
              const SizedBox(height: 80),
              state is ForgotPasswordLoadingState
                  ? CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    )
                  : CustomButton(
                      onPressed: () {
                        if (BlocProvider.of<AuthCubit>(context)
                            .forgotPasswordFormKey
                            .currentState!
                            .validate()) {
                          BlocProvider.of<AuthCubit>(context)
                              .resetPasswordWithEmail();
                          customReplacementNavigate(context, '/signin');
                        }
                      },
                      text: AppStrings.sendResetPasswordLink),
            ],
          ),
        );
      },
    );
  }
}
