import 'package:mart_app/constants/export.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PaymentController());
    final cartController = Get.find<CartController>();
    return Obx(
          () => Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          backgroundColor: whiteColor,
          title: "Choose a payment method"
              .text
              .fontFamily(semibold)
              .color(darkFontGrey)
              .make(),
          iconTheme: IconThemeData(color: darkFontGrey),
        ),
        bottomNavigationBar: controller.placedOrder.value
            ? Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(redColor),
          ),
        )
            : MyButton(
          buttonName: "Place Order",
          buttonColor: redColor,
          height: 60,
          borderRadius: BorderRadius.circular(12.5),
          style: TextStyle(color: whiteColor, fontFamily: semibold),
          onTap: () async {
            try {
              controller.placedOrder.value = true; // Display loading indicator
              await controller.placeOrder(
                orderPaymentMethod:
                paymentMethodList[controller.paymentIndex.value]["name"],
                totalAmount: cartController.totalPrice.value,
              );
              await controller.clearCart();
              controller.placedOrder.value = false; // Reset loading indicator

              Get.offAll(() => BottomNavbarScreen()); // Navigate after successful order
              VxToast.show(context, msg: "Order Placed Successfully");
            } catch (e) {
              controller.placedOrder.value = false; // Reset loading indicator on error
              VxToast.show(context, msg: "Failed to place order");
            }
          },
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                    () => Column(
                  children: List.generate(paymentMethodList.length, (index) {
                    final data = paymentMethodList[index];
                    return GestureDetector(
                      onTap: () {
                        controller.changePaymentIndex(index);
                        print(index);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                          bottom: 8,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: controller.paymentIndex.value == index
                                ? tealColor
                                : Colors.transparent,
                            width: 4,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.5),
                              child: Image.asset(
                                data["img"]!,
                                width: double.infinity,
                                height: 150,
                                fit: BoxFit.cover,
                                colorBlendMode:
                                controller.paymentIndex.value == index
                                    ? BlendMode.darken
                                    : BlendMode.lighten,
                                color: Colors.black.withOpacity(0.3),
                              ),
                            ),
                            if (controller.paymentIndex.value == index)
                              Transform.scale(
                                scale: 1.25,
                                child: Checkbox(
                                  activeColor: tealColor,
                                  shape: const CircleBorder(),
                                  value: true,
                                  onChanged: (value) {},
                                ),
                              ),
                            Positioned(
                              bottom: 2,
                              right: 12.5,
                              child: data["name"]
                                  .toString()
                                  .text
                                  .color(whiteColor)
                                  .fontFamily(bold)
                                  .make(),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              15.heightBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: RichText(
                  text: TextSpan(
                    text: "Note : ",
                    style: TextStyle(color: fontGrey, fontFamily: semibold),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                        "Only cash on delivery service available right now. Other payment methods will be soon added!",
                        style: TextStyle(fontFamily: regular, color: tealColor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}