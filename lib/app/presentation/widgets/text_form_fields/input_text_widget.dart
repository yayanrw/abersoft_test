import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class InputTextWidget extends StatelessWidget {
  const InputTextWidget({
    super.key,
    required this.controller,
    required this.hintText,
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Color(0xFFADADAD))),
          contentPadding: const EdgeInsets.symmetric(vertical: 11)),
      style: const TextStyle(
        fontSize: 12,
        color: Colors.black,
      ),
      textAlign: TextAlign.center,
      validator: ValidationBuilder().required().build(),
    );
  }
}
