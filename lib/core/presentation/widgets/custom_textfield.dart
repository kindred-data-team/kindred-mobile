import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kindred_app/common/theme/theme_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField(
      {super.key,
      this.labelText,
      this.hintText,
      this.controller,
      this.keyboardType = TextInputType.text,
      required this.obscureText,
      this.validator,
      this.prefixIcon,
      this.inputFormatters});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isTextVisible;

  @override
  void initState() {
    super.initState();
    isTextVisible = !widget.obscureText;
  }

  void toggleVisibility() {
    setState(() {
      isTextVisible = !isTextVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: !isTextVisible,
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        floatingLabelStyle: const TextStyle(color: AppColors.primaryColor),
        hintStyle:
            TextStyle(color: AppColors.inactiveTextfield, fontSize: 16.px),
        prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  isTextVisible ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.primaryColor,
                ),
                onPressed: toggleVisibility,
              )
            : null,
        enabledBorder: const UnderlineInputBorder(
          borderSide:
              BorderSide(color: AppColors.inactiveTextfield, width: 1.0),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor, width: 2.0),
        ),
      ),
    );
  }
}
