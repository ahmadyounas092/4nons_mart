import 'package:mart_app/constants/export.dart';

class MyButton extends StatelessWidget {
  final Color? borderColor;
  final Border? border;
  final String buttonName;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? buttonColor;
  final BorderRadius? borderRadius;
  final double? elevation;
  final List<BoxShadow>? boxShadow;
  final BoxShape? boxShape;
  final double? height;
  final double? width;
  final TextStyle? style;
  final TextAlign? textAlign;
  final void Function()? onTap;

  const MyButton({
    super.key,
    required this.buttonName,
    this.textAlign,
    this.borderRadius,
    this.boxShadow,
    this.boxShape,
    this.buttonColor,
    this.elevation,
    this.height,
    this.margin,
    this.width,
    this.padding,
    this.border,
    this.borderColor,
    this.style,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: elevation,
        child: Container(
          margin: margin,
          padding: padding,
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: buttonColor,
            border: border,
          ),
          child: Center(
            child: Text(
              buttonName,
              style: style,
              textAlign: textAlign ?? TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
