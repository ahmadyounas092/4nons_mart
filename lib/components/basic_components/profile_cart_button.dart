import 'package:mart_app/constants/export.dart';

class ProfileCartButton extends StatelessWidget {
  final String? title;
  final String? value;
  const ProfileCartButton({super.key, this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            "$value".text.fontFamily(bold).color(darkFontGrey).make(),
            2.5.heightBox,
            "$title".text.make(),
          ],
        ).box.white
        .customRounded(const BorderRadius.all(Radius.circular(10)))
        .width(context.screenWidth / 3.35)
        .height(80)
        .padding(const EdgeInsets.all(4))
        .make();
  }
}
