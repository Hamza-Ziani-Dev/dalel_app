// ignore_for_file: use_key_in_widget_constructors

import 'package:dalel_app/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/auth_state.dart';
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
      },
      builder: (context, state) {
        return Form(
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
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                onPressed: () {
                  BlocProvider.of<AuthCubit>(context)
                      .signUpUserWithEmailAndPassword();
                },
                text: AppStrings.signUp,
              ),
            ],
          ),
        );
      },
    );
  }
}
