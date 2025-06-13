import '../../../constants/export.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());

    // ✅ Check if user is logged in
    if (currentUser == null) {
      return const Scaffold(
        body: Center(
          child: Text(
            "User not logged in.",
            style: TextStyle(fontSize: 16, color: Colors.red),
          ),
        ),
      );
    }

    return bgWidget(
      Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          backgroundColor: redColor,
          automaticallyImplyLeading: false,
          title:
              "Shopping Cart".text
                  .color(lightGrey)
                  .fontFamily(bold)
                  .align(TextAlign.center)
                  .make(),
        ),
        body: StreamBuilder(
          stream: FirestoreServices.getCartItems(currentUser!.uid),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(indigoColor),
                ),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return Center(
                child:
                    "Cart is empty".text
                        .color(indigoColor)
                        .fontFamily(bold)
                        .make(),
              );
            } else {
              var data = snapshot.data!.docs;
              controller.calculateCartTotal(data);
              controller.productSnapshot = data;

              return Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                "${data[index]["image"]}",
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Row(
                              children: [
                                Flexible(
                                  child: "${data[index]["title"]}".text
                                      .fontFamily(semibold)
                                      .size(16)
                                      .make(),
                                ),
                                20.widthBox,
                                "quantity".text.size(10).make(),
                                5.widthBox,
                                "(x${data[index]['quantity']})".text
                                    .color(fontGrey)
                                    .make(),
                              ],
                            ),
                            subtitle:
                                "${data[index]["totalPrice"]}".numCurrency.text
                                    .fontFamily(semibold)
                                    .color(tealColor)
                                    .make(),
                            trailing: Icon(Icons.delete, color: redColor).onTap(
                              () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return DeleteDialog(
                                      onTap: () {
                                        FirestoreServices.deleteDocument(
                                          data[index].id,
                                        );
                                        Navigator.of(context).pop();
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "Total Price".text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                            Obx(
                              () =>
                                  "${controller.totalPrice}".numCurrency.text
                                      .fontFamily(semibold)
                                      .color(redColor)
                                      .make(),
                            ),
                          ],
                        ).box
                        .padding(const EdgeInsets.all(12))
                        .margin(const EdgeInsets.symmetric(horizontal: 5))
                        .customRounded(BorderRadius.circular(5))
                        .color(golden)
                        .make(),
                    const SizedBox(height: 5),
                    MyButton(
                      buttonName: "Proceed to ship",
                      style: const TextStyle(
                        color: lightGrey,
                        fontFamily: bold,
                      ),
                      borderRadius: BorderRadius.circular(5),
                      width: double.infinity,
                      textAlign: TextAlign.center,
                      buttonColor: redColor,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      onTap: () {
                        Get.to(() => ShippingDetails());
                      },
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
