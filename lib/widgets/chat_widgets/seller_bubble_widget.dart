import 'package:intl/intl.dart'; // couldn't do export for this package, bcz just use for the single page
import 'package:mart_app/constants/export.dart';

Widget sellerBubbleWidget(DocumentSnapshot data) {
  final timeData =
      data['created_on'] == null
          ? DateTime.now()
          : (data['created_on'] as Timestamp).toDate();

  // Format the DateTime to a readable string
  var formattedDateTime = DateFormat('dd MMM yyyy, hh:mm a').format(timeData);

  return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "${data['msg']}".text
              .color(whiteColor)
              .fontFamily(semibold)
              .size(16)
              .make(),
          7.5.heightBox,
          formattedDateTime.text.color(lightGrey).size(8).make(),
        ],
      ).box
      .color(indigoColor)
      .margin(EdgeInsets.only(bottom: 5, left: 3.5, right: 7.5))
      .padding(EdgeInsets.only(left: 8.5, top: 6, bottom: 6, right: 6))
      .customRounded(
        BorderRadius.only(
          bottomLeft: Radius.circular(17.5),
          topLeft: Radius.circular(17.5),
          topRight: Radius.circular(17.5),
        ),
      )
      .make();
}
