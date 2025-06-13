import '../../constants/export.dart';

class MessagingScreen extends StatelessWidget {
  const MessagingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        title:
            "My Messages".text.color(darkFontGrey).fontFamily(semibold).make(),
        iconTheme: IconThemeData(color: darkFontGrey),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getAllMessages(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              ),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return "You don't have any message yet!".text
                .fontFamily(semibold)
                .color(darkFontGrey)
                .makeCentered();
          } else {
            var data = snapshot.data!.docs;
            return Column(
              children: [
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 2.0,
                        color: Colors.blueAccent[200],
                        child: ListTile(
                          title:
                              "${data[index]["seller_Name"]}".text
                                  .fontFamily(semibold)
                                  .color(tealColor)
                                  .make(),
                          subtitle:
                              "${data[index]["last_msg"]}".text
                                  .color(Vx.gray100)
                                  .make(),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                          ).onTap(() {
                            Get.to(
                              () => ChatScreen(
                                sellerName: data[index]["seller_Name"],
                              ),
                              arguments: [
                                data[index]["seller_Name"].toString(),
                                data[index]["toId"].toString(),
                              ],
                            );
                          }),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ).box.margin(EdgeInsets.all(8)).make();
          }
        },
      ),
    );
  }
}
