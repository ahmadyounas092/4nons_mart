import 'package:mart_app/constants/export.dart';

Widget orderStatusWidget({
  required IconData icon, // Specifies the icon type
  required Color color, // Defines the color type
  required String title, // Ensures title is a string
  required bool showDone, // Ensures showDone is a boolean
}) {
  return SizedBox(
    height: 50,
    child: ListTile(
      leading:
          Icon(icon, color: color).box.roundedSM.padding(EdgeInsets.all(5))
              .border(color: color)
              .make(), // Wraps the icon inside a border box
      subtitle: Divider(color: lightGrey,),
      trailing: SizedBox(
        width: 180,
        child: Row(
          children: [
            Expanded(child: title.text.color(darkFontGrey).make()),
            // Ensures title is displayed correctly
            45.widthBox,
            showDone ? Icon(Icons.done, color: color) : Container(),
            // Displays done icon if true
          ],
        ),
      ),
    ),
  );
}
