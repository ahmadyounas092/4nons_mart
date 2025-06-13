import '../../constants/export.dart';

class AuthTextfield extends StatelessWidget {
  final String? labelText;
  final bool obsText;
  final bool isDense;
  final String? hintText;
  final Color? fillColor;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;
  final IconButton? suffixIcon;

  const AuthTextfield({
    super.key,
    this.controller,
    this.hintText,
    this.keyboardType,
    this.labelText,
    required this.obsText,
    required this.isDense,
    this.fillColor,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obsText,
      controller: controller,
      decoration: InputDecoration(
        isDense: isDense,
        fillColor: fillColor ?? lightGrey,
        filled: true,
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(color: indigoColor, fontWeight: FontWeight.bold),
        prefixIcon: Icon(prefixIcon, color: indigoColor),
        suffixIcon: suffixIcon,
        hintStyle: const TextStyle(color: textfieldGrey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // Default border radius
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // Border radius on focus
          borderSide: BorderSide(color: indigoColor),
        ),
      ),
      keyboardType: keyboardType,
    );
  }
}
