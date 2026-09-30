import 'package:flutter/material.dart';
import 'package:tradly/presentation/resourcses/values_manager.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;
  final TextInputType? keyboardType;
  final String? labelText;
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.errorText,
    this.keyboardType,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppPadding.p40,
        right: AppPadding.p40,
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(labelText: labelText, errorText: errorText),
      ),
    );
  }
}
