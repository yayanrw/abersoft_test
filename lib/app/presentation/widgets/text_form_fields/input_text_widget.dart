import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class InputTextWidget extends StatelessWidget {
  const InputTextWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.isObscureText = false,
    this.textAlign = TextAlign.center,
    this.minLines = 1,
  });

  final TextEditingController controller;
  final String hintText;
  final bool isObscureText;
  final TextAlign textAlign;
  final int minLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minLines,
      maxLines: minLines,
      obscureText: isObscureText,
      keyboardType: TextInputType.text,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Color(0xFFADADAD))),
          contentPadding: const EdgeInsets.symmetric(vertical: 11, horizontal: 11)),
      style: const TextStyle(
        fontSize: 12,
        color: Colors.black,
      ),
      textAlign: textAlign,
      validator: ValidationBuilder().required().build(),
    );
  }
}
