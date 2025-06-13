import '../../constants/export.dart';

class HomeButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String? iconImage;
  final String? dealName;
  final void Function()? onTap;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const HomeButton(
      {super.key,
      this.iconImage,
      this.dealName,
      this.height,
      this.width,
      this.onTap,
      this.borderRadius,
      this.margin,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 2.0,
          child: Container(
            height: height,
            width: width,
            margin: margin,
            padding: padding,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: whiteColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "$iconImage",
                  width: 26,
                ),
                15.heightBox,
                Center(
                    child: "$dealName"
                        .text
                        .fontFamily(bold)
                        .color(darkFontGrey)
                        .make()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
