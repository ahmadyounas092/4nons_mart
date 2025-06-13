import 'package:mart_app/constants/export.dart';

Widget orderedItem(dynamic data) {
  return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: data["orders"].length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      data["orders"][index]["product_title"]
                          .toString()
                          .text
                          .color(darkFontGrey)
                          .fontFamily(semibold)
                          .make(),
                      Row(
                        children: [
                          "${data["orders"][index]["quantity"]} x".text
                              .fontFamily(regular)
                              .make(),
                          2.5.widthBox,
                          Container(
                            width: 30,
                            height: 12.5,
                            color: Color(data["orders"][index]["color"]),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      data["orders"][index]["totalPrice"]
                          .toString()
                          .numCurrency
                          .text
                          .color(darkFontGrey)
                          .fontFamily(semibold)
                          .make(),
                      "Refundable".text.fontFamily(regular).make(),
                    ],
                  ),
                ],
              ),
              Divider(),
            ],
          );
        },
      ).box
      .color(whiteColor)
      .padding(EdgeInsets.all(15))
      .margin(EdgeInsets.symmetric(horizontal: 15))
      .roundedSM
      .shadowSm
      .make();
}
