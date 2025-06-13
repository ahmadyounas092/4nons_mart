import '../../constants/export.dart';

Widget applogoWidget() {
  // using the velocity x package here in that widget
  return Image.asset(icAppLogo)
      .box
      .white
      .size(85, 90)
      .padding(const EdgeInsets.all(12.5))
      .rounded
      .make();
}
