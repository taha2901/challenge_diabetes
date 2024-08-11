import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class CustomField extends StatefulWidget {
  final IconData icon;
  final String lable;
  final TextEditingController controller;
  final bool isPass;
  final bool showBorder;
  final Color? fillColor;
  final String? hint;
  final String? prefixText;
  final Function(String)? onChange;
  final Function(String)? onSubmitted;
  final bool? obscure;
  final TextInputType? inputType;
  final Widget? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? suffixPressed;
  final bool? ispassword;
  final List<String>? dropdownItems;
  final void Function(String?)? onDropdownChanged;
  final Color? textColor;
  final double? width;
  final double? height;
  final Color? backgroundColor;

  const CustomField({
    super.key,
    required this.icon,
    required this.lable,
    required this.controller,
    this.isPass = false,
    required this.showBorder,
    this.fillColor,
    this.hint,
    this.prefixText,
    this.onChange,
    this.onSubmitted,
    this.obscure,
    this.inputType,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixPressed,
    this.ispassword,
    this.dropdownItems,
    this.onDropdownChanged,
    this.textColor,
    this.width,
    this.height,
    this.backgroundColor,
  });

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  bool obscure = true;

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرقم السري مطلوب';
    }
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    if (!regex.hasMatch(value)) {
      return 'يجب أن يحتوي الرقم السري على حرف كبير وصغير ورقم ورمز';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextFormField(
        validator: widget.isPass ? _passwordValidator : (value) => value!.isEmpty ? "مطلوب" : null,
        obscureText: widget.isPass ? obscure : false,
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: widget.isPass
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      obscure = !obscure;
                    });
                  },
                  icon: Icon(obscure ? Iconsax.eye : Iconsax.eye_slash),
                )
              : null,
          contentPadding: const EdgeInsets.all(16),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.blue,
            ),
          ),
          labelText: widget.lable,
          prefixIcon: Icon(widget.icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.start,
        onTap: widget.suffixPressed,
        keyboardType: widget.inputType,
        onChanged: widget.onChange,
        onFieldSubmitted: widget.onSubmitted,
      ),
    );
  }
}
