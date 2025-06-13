import '../../constants/export.dart';

class AuthButton extends StatelessWidget {
  final String? buttonName;
  final Color? buttonColor;
  final Function()? onTap;

  const AuthButton(
      {super.key,
      this.buttonColor,
      required this.buttonName,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12.5),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: buttonColor,
        ),
        child: Center(
          child: Text(
            buttonName ?? "Authenticate",
            style:
                const TextStyle(fontWeight: FontWeight.bold, color: whiteColor),
          ),
        ),
      ),
    );
  }
}
