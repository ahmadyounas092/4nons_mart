import 'package:mart_app/constants/export.dart';

Widget colorQuantityTotal(BuildContext context, dynamic data) {
  final controller = Get.find<ProductController>();

  // Normalize p_colors safely
  List<int> colorList = [];
  if (data["p_colors"] is List) {
    try {
      colorList =
          (data["p_colors"] as List).map((c) {
            if (c is String) {
              return int.tryParse(c) ?? 0xffffffff;
            } else if (c is int) {
              return c;
            } else {
              return 0xffffffff;
            }
          }).toList();
    } catch (e) {
      print("Failed to parse color list: $e");
    }
  } else if (data["p_colors"] is int) {
    colorList = [data["p_colors"]];
  }

  return Obx(
    () =>
        Column(
              children: [
                Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child:
                              "Color: ".text
                                  .size(16)
                                  .color(textfieldGrey)
                                  .make(),
                        ),
                        Row(
                          children: List.generate(colorList.length, (index) {
                            int colorInt = colorList[index];
                            return Stack(
                              alignment: Alignment.center,
                              children: [
                                VxBox()
                                    .size(35, 35)
                                    .roundedFull
                                    .margin(
                                      const EdgeInsets.symmetric(horizontal: 4),
                                    )
                                    .color(Color(colorInt))
                                    .make()
                                    .onTap(() {
                                      controller.changeColorIndex(index);
                                    }),
                                Visibility(
                                  visible: index == controller.colorIndex.value,
                                  child: Icon(Icons.done, color: lightGrey),
                                ),
                              ],
                            );
                          }),
                        ),
                      ],
                    ).box
                    .padding(
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    )
                    .make(),
                Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child:
                              "Quantity: ".text
                                  .size(16)
                                  .color(textfieldGrey)
                                  .make(),
                        ),
                        Obx(
                          () => Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (controller.quantity.value > 0) {
                                    double price;
                                    try {
                                      price = double.parse(data['p_price']);
                                    } catch (e) {
                                      print(
                                        "Error parsing price: ${data['p_price']}",
                                      );
                                      price = 0.0;
                                    }
                                    controller.decreaseQuantity();
                                    controller.calculateTotalPrice(price);
                                  }
                                },
                                icon: const Icon(Icons.remove),
                              ),
                              5.widthBox,
                              controller.quantity.value.text
                                  .size(18)
                                  .color(darkFontGrey)
                                  .fontFamily(bold)
                                  .make(),
                              5.widthBox,
                              IconButton(
                                onPressed: () {
                                  double price;
                                  try {
                                    price = double.parse(data['p_price']);
                                  } catch (e) {
                                    print(
                                      "Error parsing price: ${data['p_price']}",
                                    );
                                    price = 0.0;
                                  }
                                  controller.increaseQunatity(
                                    int.parse(data['p_quantity']),
                                  );
                                  controller.calculateTotalPrice(price);
                                },
                                icon: const Icon(Icons.add),
                              ),
                              10.widthBox,
                              "${data["p_quantity"]} available".text
                                  .color(textfieldGrey)
                                  .size(16)
                                  .make(),
                            ],
                          ),
                        ),
                      ],
                    ).box
                    .padding(
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    )
                    .make(),
                Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child:
                              "Total: ".text
                                  .size(16)
                                  .color(textfieldGrey)
                                  .make(),
                        ),
                        controller.totalPrice.value.numCurrency.text
                            .color(redColor)
                            .size(16)
                            .fontFamily(bold)
                            .make(),
                      ],
                    ).box
                    .color(Vx.gray200)
                    .padding(
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    )
                    .make(),
              ],
            ).box.white
            .margin(EdgeInsets.symmetric(horizontal: 9))
            .customRounded(
              const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            )
            .shadowSm
            .make(),
  );
}
