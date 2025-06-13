import '../../constants/export.dart';

class ChatScreen extends StatelessWidget {
  final dynamic sellerName;
  const ChatScreen({super.key, required this.sellerName});

  @override
  Widget build(BuildContext context) {
    ChatController controller = Get.put(ChatController());
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: redColor,
        title: "$sellerName".text.fontFamily(semibold).color(lightGrey).make(),
      ),
      body: Column(
        children: [
          Obx(
            () =>
                controller.isLoading.value
                    ? Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(redColor),
                        ),
                      ),
                    )
                    : Expanded(
                      child: StreamBuilder(
                        stream: FirestoreServices.getAllChats(
                          controller.chatDocId.toString(),
                        ),
                        builder: (
                          context,
                          AsyncSnapshot<QuerySnapshot> snapshot,
                        ) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(redColor),
                              ),
                            );
                          } else if (snapshot.data!.docs.isEmpty) {
                            return Center(
                              child:
                                  "Send a new message...".text
                                      .color(darkFontGrey)
                                      .fontFamily(semibold)
                                      .make(),
                            );
                          } else {
                            // Ensure that you are mapping the correct data and handling the messages
                            return ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                var data = snapshot.data!.docs[index];
                                // Check if the message is from the user or the seller
                                bool isUserMessage =
                                    data['uid'] == currentUser!.uid;

                                // Use buyerBubbleWidget for user messages, sellerBubbleWidget for seller messages
                                return Align(
                                  alignment:
                                      isUserMessage
                                          ? Alignment.centerRight
                                          : Alignment.centerLeft,
                                  child:
                                      isUserMessage
                                          ? buyerBubbleWidget(data).box
                                              .margin(
                                                const EdgeInsets.only(top: 5),
                                              )
                                              .make()
                                          : sellerBubbleWidget(data).box
                                              .margin(
                                                const EdgeInsets.only(top: 5),
                                              )
                                              .make(),
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
          ),
          Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.messageController,
                      decoration: InputDecoration(
                        hintText: "Write a message...",
                        hintStyle: TextStyle(color: fontGrey),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: darkFontGrey),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.5),
                            bottomLeft: Radius.circular(12.5),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: darkFontGrey),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.5),
                            bottomLeft: Radius.circular(12.5),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Icon(Icons.send, color: whiteColor)
                      .onTap(() {
                        controller.sendMessage(
                          controller.messageController.text,
                        );
                        controller.messageController.clear();
                      })
                      .box
                      .color(indigoColor)
                      .height(55)
                      .padding(EdgeInsets.all(12))
                      .customRounded(
                        BorderRadius.only(
                          topRight: Radius.circular(12.5),
                          bottomRight: Radius.circular(12.5),
                        ),
                      )
                      .make(),
                ],
              ).box
              .height(66)
              .padding(EdgeInsets.only(left: 10, right: 10, bottom: 8, top: 5))
              .make(),
        ],
      ),
    );
  }
}
