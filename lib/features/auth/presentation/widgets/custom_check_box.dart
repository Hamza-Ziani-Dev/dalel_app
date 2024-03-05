import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomChekBox extends StatefulWidget {
  const CustomChekBox({super.key});

  @override
  State<CustomChekBox> createState() => _CustomChekBoxState();
}

class _CustomChekBoxState extends State<CustomChekBox> {
  bool? value = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      side: BorderSide(color: AppColors.gray),
      value: value,
      onChanged: (val) {
        setState(() {
          value = val;
          BlocProvider.of<AuthCubit>(context).updateStatusCheckBox(val: val);
        });
      },
    );
  }
}
