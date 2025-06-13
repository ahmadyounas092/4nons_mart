import 'package:mart_app/constants/export.dart';

Widget dealButtons2(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(3, (index) {
        return HomeButton(
          borderRadius: BorderRadius.circular(12.5),
          height: context.screenHeight * 0.15,
          width: context.screenWidth / 3.5,
          dealName: dealNames2[index]["dealName"],
          iconImage: dealNames2[index]["icon"],
        );
      }),
    ),
  );
}
