import 'package:intl/intl.dart';
import 'package:mart_app/constants/export.dart';

Widget orderPaymentAddress(dynamic data) {
  return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Order Code & Shipping Method
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Order Code".text
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .make(),
                    "${data["order_id"]}".text
                        .fontFamily(bold)
                        .size(17.5)
                        .color(redColor)
                        .make(),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    "Shipping Method".text
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .make(),
                    "${data["shipping_method"]}".text
                        .fontFamily(bold)
                        .size(10)
                        .color(Vx.gray400)
                        .make(),
                  ],
                ),
              ),
            ],
          ),
          7.5.heightBox,

          // Order Date & Payment Method
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Order Date".text
                        .fontFamily(bold)
                        .color(darkFontGrey)
                        .make(),
                    DateFormat('yyyy-MM-dd')
                        .format((data["order_date"] as Timestamp).toDate())
                        .text
                        .fontFamily(bold)
                        .size(10)
                        .color(Vx.gray400)
                        .make(),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    "Payment Method".text
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .make(),
                    "${data["payment_method"]}".text
                        .fontFamily(bold)
                        .size(10)
                        .color(Vx.gray400)
                        .make(),
                  ],
                ),
              ),
            ],
          ),
          7.5.heightBox,

          // Payment Status & Delivery Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Payment Status".text
                        .fontFamily(bold)
                        .color(darkFontGrey)
                        .make(),
                    Row(
                      children: [
                        "Unpaid".text
                            .fontFamily(bold)
                            .color(Vx.gray400)
                            .size(10)
                            .make(),
                        5.widthBox,
                        Icon(Icons.cancel, color: redColor, size: 14),
                      ],
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    "Delivery Status".text
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .make(),
                    "Order Placed".text
                        .fontFamily(bold)
                        .size(10)
                        .color(Vx.gray400)
                        .make(),
                  ],
                ),
              ),
            ],
          ),
          15.heightBox,

          // Shipping Address and Total Amount Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Shipping Address".text
                  .fontFamily(bold)
                  .color(darkFontGrey)
                  .make(),
              "Total Amount".text.fontFamily(bold).color(darkFontGrey).make(),
            ],
          ),
          5.heightBox,

          // Address details and total amount
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Shipping Address
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    infoRow("Name: ", data["order_by_name"]),
                    infoRow("Email: ", data["order_by_email"]),
                    infoRow("Address: ", data["order_by_address"]),
                    infoRow("Country: ", "Pakistan"),
                    infoRow("State: ", data["order_by_state"]),
                    infoRow("City: ", data["order_by_city"]),
                    infoRow("Phone: ", data["order_by_phone"]),
                    infoRow("Postal Code: ", data["order_by_postalcode"]),
                  ],
                ),
              ),

              // Total Amount
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    "PKR:".text
                        .color(indigoColor)
                        .fontFamily(bold)
                        .size(16)
                        .make(),
                    "${data["total_amount"]}".numCurrency.text
                        .fontFamily(bold)
                        .color(redColor)
                        .size(16)
                        .make(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ).box
      .color(whiteColor)
      .padding(const EdgeInsets.all(15))
      .margin(const EdgeInsets.symmetric(horizontal: 15))
      .roundedSM
      .shadowSm
      .make();
}

// Utility widget for text rows in address block
Widget infoRow(String label, String value) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Flexible(
        flex: 2,
        child: label.text.fontFamily(bold).size(10).color(Vx.gray400).make(),
      ),
      Flexible(
        flex: 3,
        child: value.text.fontFamily(semibold).size(10).color(tealColor).make(),
      ),
    ],
  );
}
