import 'package:mart_app/constants/export.dart';

Widget dealButtons1(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(2, (index) {
        return HomeButton(
          borderRadius: BorderRadius.circular(12.5),
          padding: const EdgeInsets.all(28),
          width: context.screenWidth * 0.44,
          dealName: dealNames1[index]["dealName"],
          iconImage: dealNames1[index]["icon"],
        );
      }),
    ),
  );
}
