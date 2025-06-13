import 'package:mart_app/constants/export.dart';

Widget sellerSection(BuildContext context, dynamic data) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child:
    Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Seller".text.white.fontFamily(semibold).make(),
              2.5.heightBox,
              "${data["p_seller"]}".text
                  .color(yellowColor)
                  .fontFamily(semibold)
                  .size(16)
                  .make(),
            ],
          ),
        ),
        CircleAvatar(
          backgroundColor: whiteColor,
          child: Icon(Icons.message, color: darkFontGrey).onTap(() {
            Get.to(
                  () => ChatScreen(sellerName: data['p_seller'],),
              arguments: [
                data?['p_seller'] ?? "Unknown Seller",
                data?['vendor_id'] ?? "Unknown Client",
              ],
            );
          }),
        ),
      ],
    ).box
        .customRounded(
      const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    )
        .padding(const EdgeInsets.symmetric(horizontal: 12))
        .height(62)
        .shadowSm
        .color(tealColor)
        .make(),
  );
}
