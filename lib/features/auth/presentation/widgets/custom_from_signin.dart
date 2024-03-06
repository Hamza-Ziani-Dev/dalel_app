// ignore_for_file: use_key_in_widget_constructors
import 'package:dalel_app/core/functions/custom_toast.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/auth_state.dart';
import 'package:dalel_app/features/splach/presentation/widgets/custom_navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dalel_app/core/utils/app_string.dart';
import 'package:dalel_app/core/widgets/custom_button.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_text_field_widget.dart';

class CustomFormSignin extends StatelessWidget {
  const CustomFormSignin({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // Add any listener logic here if needed
        if (state is SignInSuccessState) {
          showToast("Welcome");
          customNavigate(context, '/signin');
        } else if (state is SignInFieldState) {
          showToast(state.errorMessage);
        }
      },
      builder: (context, state) {
        return Form(
          key: BlocProvider.of<AuthCubit>(context).signInFormKey,
          child: Column(
            children: [
              CustomTextFieldWidget(
                labelText: AppStrings.emailAddress,
                onChanged: (emailAddress) {
                  BlocProvider.of<AuthCubit>(context).emailAddress =
                      emailAddress;
                },
              ),
              CustomTextFieldWidget(
                labelText: AppStrings.password,
                onChanged: (password) {
                  BlocProvider.of<AuthCubit>(context).password = password;
                },
              ),
              const ForgetPasswordTestWidget(),
              const SizedBox(height: 100),
              state is SignInLoadingState
                  ? CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    )
                  : CustomButton(
                      onPressed: () {
                          if (BlocProvider.of<AuthCubit>(context)
                              .signInFormKey
                              .currentState!
                              .validate()) {
                            BlocProvider.of<AuthCubit>(context)
                                .signInUserWithEmailAndPassword();
                            customReplacementNavigate(context, '/home');
                          }
                       
                      },
                      text: AppStrings.signIn),
            ],
          ),
        );
      },
    );
  }
}

class ForgetPasswordTestWidget extends StatelessWidget {
  const ForgetPasswordTestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customReplacementNavigate(context, "path");
      },
      child: const Align(
        alignment: Alignment.bottomRight,
        child: Text(
          AppStrings.forgotPassword,
          style: CustomTextStyles.poppins300style16,
        ),
      ),
    );
  }
}
