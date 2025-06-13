import 'package:mart_app/constants/export.dart';

Widget descriptionSection(dynamic data) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Description".text.fontFamily(semibold).color(darkFontGrey).make(),
        5.heightBox,
        "${data["p_desc"]}"
            .text
            .color(darkFontGrey)
            .make(),
      ],
    ),
  );
}


// This is a test item and its test details.. 4nons is coming back again with not having any skill and without have any kind of information about any OS