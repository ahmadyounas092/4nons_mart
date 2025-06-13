import '../../constants/export.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: "My Orders".text.color(darkFontGrey).fontFamily(semibold).make(),
        iconTheme: IconThemeData(color: darkFontGrey),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getAllOrders(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              ),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return "You don't have any order yet!".text
                .fontFamily(semibold)
                .color(darkFontGrey)
                .makeCentered();
          } else{
            var data = snapshot.data!.docs;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: "${index +1}".text.fontFamily(bold).xl.make(),
                  title: Row(
                    children: [
                      "Order ID:".text.size(5).make(),
                      15.widthBox,
                      data[index]['order_id'].toString().text.fontFamily(semibold).color(tealColor).make(),
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      "Price:".text.size(5).make(),
                      15.widthBox,
                      data[index]["total_amount"].toString().numCurrency.text.color(redColor).make(),
                      5.widthBox,
                      "pkr".text.color(indigoColor).make()
                    ],
                  ),
                  trailing: IconButton(onPressed: (){
                    Get.to(OrderDetailsScreen(data: data[index].data() as Map<String, dynamic>,));
                  }, icon: Icon(Icons.arrow_forward_ios, color: darkFontGrey,)),
                );
              },
            );
          }
        },
      ),
    );
  }
}
