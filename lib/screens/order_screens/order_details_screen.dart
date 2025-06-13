import '../../constants/export.dart';

class OrderDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> data;

  const OrderDetailsScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: "Order Details".text.fontFamily(semibold).color(redColor).make(),
        centerTitle: true,
        iconTheme: IconThemeData(color: darkFontGrey),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Column(
              children: [
                orderStatusWidget(
                  color: redColor,
                  icon: Icons.done,
                  title: "Order Placed",
                  showDone: data["order_placed"],
                ),
                orderStatusWidget(
                  color: Colors.blue,
                  icon: Icons.thumb_up_sharp,
                  title: "Order Confirmed",
                  showDone: data["order_confirmed"],
                ),
                orderStatusWidget(
                  color: yellowColor,
                  icon: Icons.car_crash_outlined,
                  title: "On Delivery",
                  showDone: data["order_on_delivery"],
                ),
                orderStatusWidget(
                  color: tealColor,
                  icon: Icons.done_all_rounded,
                  title: "Delivered",
                  showDone: data["order_delivered"],
                ),
              ],
            ),
            35.heightBox,
            orderPaymentAddress(data),
            15.heightBox,
            "Ordered Items".text
                .fontFamily(bold)
                .color(darkFontGrey)
                .size(15)
                .make(),
            15.heightBox,
            orderedItem(data),
            15.heightBox,
          ],
        ),
      ),
    );
  }
}
