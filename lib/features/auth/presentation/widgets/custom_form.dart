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
import 'package:dalel_app/features/auth/presentation/widgets/custom_term_condition.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_text_field_widget.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // Add any listener logic here if needed
        if (state is SignUpSuccessState) {
          showToast("Add With Success!");
          customNavigate(context, '/signin');
        } else if (state is SignUpFieldState) {
          showToast(state.errorMessage);
        }
      },
      builder: (context, state) {
        return Form(
          key: BlocProvider.of<AuthCubit>(context).signUpFormKey,
          child: Column(
            children: [
              CustomTextFieldWidget(
                labelText: AppStrings.fristName,
                onChanged: (fristName) {
                  BlocProvider.of<AuthCubit>(context).firstName = fristName;
                },
                onFieldSubmitted: (val) {},
              ),
              CustomTextFieldWidget(
                labelText: AppStrings.lastName,
                onChanged: (lastName) {
                  BlocProvider.of<AuthCubit>(context).lastName = lastName;
                },
              ),
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
              const CustomTermCondition(),
              const SizedBox(height: 40),
              state is SignUpLoadingState
                  ? CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    )
                  : CustomButton(
                      color:
                          BlocProvider.of<AuthCubit>(context).statusBox == false
                              ? AppColors.gray
                              : null,
                      onPressed: () {
                        if (BlocProvider.of<AuthCubit>(context).statusBox ==
                            true) {
                          if (BlocProvider.of<AuthCubit>(context)
                              .signUpFormKey
                              .currentState!
                              .validate()) {
                            BlocProvider.of<AuthCubit>(context)
                                .signUpUserWithEmailAndPassword();
                          }
                        }
                      },
                      text: AppStrings.signUp),
            ],
          ),
        );
      },
    );
  }
}
