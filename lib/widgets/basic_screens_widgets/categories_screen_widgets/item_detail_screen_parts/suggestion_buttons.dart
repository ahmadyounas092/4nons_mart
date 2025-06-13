import 'package:mart_app/constants/export.dart';

Widget suggestionButtons(BuildContext context) {
  return ListView(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    children: List.generate(itemButtonsList.length, (index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 2.5),
        child: Card(
          color: whiteColor,
          elevation: 1.0,
          child: ListTile(
            tileColor: whiteColor,
            focusColor: lightGrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.5),
            ),
            onTap: () {},
            contentPadding: const EdgeInsets.only(
              right: 2.5,
              left: 12.5,
              top: 0,
              bottom: 0,
            ),
            leading:
                itemButtonsList[index].text
                    .fontFamily(semibold)
                    .color(darkFontGrey)
                    .size(15)
                    .make(),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ),
      );
    }),
  );
}
