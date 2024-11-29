import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kindred_app/common/theme/theme_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchWidget extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Widget? suffixIcon;
  final Function onChanged;

  const SearchWidget(
      {super.key,
      this.labelText,
      this.hintText,
      this.controller,
      this.keyboardType = TextInputType.text,
      this.validator,
      this.prefixIcon,
      this.inputFormatters,
      this.floatingLabelBehavior,
      this.suffixIcon,
      required this.onChanged});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.search),
        floatingLabelBehavior:
            widget.floatingLabelBehavior ?? FloatingLabelBehavior.never,
        labelText: widget.labelText,
        hintText: widget.hintText,
        hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16.px,
            color: AppColors.dividerColor),
        floatingLabelStyle: const TextStyle(color: AppColors.primaryColor),
        prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide:
              const BorderSide(color: AppColors.primaryColor, width: 2.0),
        ),
      ),
    );
  }
}
