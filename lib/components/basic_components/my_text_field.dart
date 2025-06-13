import '../../constants/export.dart';

class MyTextField extends StatelessWidget {
  final String? hintText;
  final Icon? prefixIcon;
  final TextInputType? keyboardType;
  final String? labelText;
  final IconButton? suffixIcon;
  final String? Function(String?)? validator;
  final bool obsText;
  final bool? isDense;
  final void Function(String)? onChanged;
  final Color? fillColor;
  final Color? cursorColor;
  final bool? isFilled;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final InputBorder? border;
  final InputBorder? focusBorder; // Added InputBorder as a parameter

  const MyTextField({
    super.key,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.hintText,
    this.isDense,
    this.labelText,
    this.onChanged,
    required this.obsText,
    this.fillColor,
    this.cursorColor,
    this.isFilled,
    this.controller,
    this.contentPadding,
    this.validator,
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
    this.border,
    this.focusBorder, // Initialize the parameter
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsText,
      onChanged: onChanged,
      keyboardType: keyboardType ?? TextInputType.text,
      cursorColor: cursorColor,
      controller: controller,
      validator: validator,
      style: textStyle,
      decoration: InputDecoration(
        border: border ?? InputBorder.none,
        focusedBorder: focusBorder, // Apply outline input border
        filled: isFilled,
        fillColor: fillColor,
        hintText: hintText,
        hintStyle: hintStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        isDense: isDense,
        labelText: labelText,
        labelStyle: labelStyle,
        contentPadding: contentPadding,
      ),
    );
  }
}
