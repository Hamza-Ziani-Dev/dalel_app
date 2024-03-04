import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

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
      side: BorderSide(color: AppColors.gray),
      value: value,
      onChanged: (val) {
        value = val;
      },
    );
  }
}