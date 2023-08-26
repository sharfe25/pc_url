import 'package:flutter/material.dart';
import 'package:pc_url/core/configs/styles/app_colors.dart';

class InputUrl extends StatelessWidget {
  const InputUrl(
      {Key? key,
      required this.validator,
      required this.controller,
      required this.labelText,
      this.hintText})
      : super(key: key);
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String labelText;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(
            labelText,
            style: const TextStyle(
                color: Color.fromARGB(255, 46, 46, 46),
                fontWeight: FontWeight.bold),
          ),
        ),
        TextFormField(
          controller: controller,
          cursorColor: AppColors.secondary,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration: InputDecoration(
            hintText: hintText ?? '',
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  10.0), 
              borderSide: const BorderSide(color: AppColors.secondary),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  10.0), 
              borderSide: const BorderSide(
                  color: AppColors.secondary), 
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  10.0), 
              borderSide: const BorderSide(
                  color: AppColors.secondary), 
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
