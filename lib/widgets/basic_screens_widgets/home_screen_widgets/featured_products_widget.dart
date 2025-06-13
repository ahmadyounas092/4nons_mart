import '../../../constants/export.dart';

Widget featuredProductWidget(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(12),
    width: context.screenWidth,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(1),
      color: indigoColor,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        5.heightBox,
        Padding(
          padding: const EdgeInsets.only(left: 6),
          child:
              "Featured Products".text.white.fontFamily(bold).size(18).make(),
        ),
        12.5.heightBox,

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: StreamBuilder(
            stream: FirestoreServices.getFeaturedProducts(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(indigoColor),
                  ),
                );
              } else if (snapshot.data!.docs.isEmpty) {
                return Center(child: "No datq found!".text.white.make());
              } else {
                var data = snapshot.data!.docs;
                return Row(
                  children: List.generate(
                    data.length,
                    (index) => Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.5),
                              child: Image.network(
                                data[index]["p_imgs"][0],
                                width: 158,
                                height: 150,
                                fit: BoxFit.fill,
                              ),
                            ),
                            10.heightBox,
                            Flexible(
                              child: Text(
                                data[index]["p_name"],
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: fontGrey,
                                  fontFamily: semibold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Text(
                              double.parse(data[index]["p_price"]).numCurrency,
                              // Convert String to double before applying numCurrency
                              style: const TextStyle(
                                color: fontGrey,
                                fontFamily: semibold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ).box.rounded
                        .margin(const EdgeInsets.symmetric(horizontal: 5))
                        .white
                        .size(165, 230)
                        .padding(const EdgeInsets.all(8))
                        .make()
                        .onTap(() {
                          Get.to(
                            () => ItemDetailsWidget(
                              itemTitle: "${data[index]["p_name"]}",
                              itemPrice: "${data[index]["p_price"]}",
                              itemImages: List<String>.from(
                                data[index]["p_imgs"],
                              ),
                              data: data[index],
                            ),
                          );
                        }),
                  ),
                );
              }
            },
          ),
        ),
        10.heightBox,
      ],
    ),
  );
}
