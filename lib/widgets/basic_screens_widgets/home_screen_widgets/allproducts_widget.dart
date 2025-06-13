import 'package:mart_app/constants/export.dart';

Widget allProductsWidget(BuildContext context) {
  return StreamBuilder(
    stream: FirestoreServices.getAllHomeProducts(),
    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (!snapshot.hasData) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(redColor),
          ),
        );
      } else {
        var data = snapshot.data!.docs;
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          shrinkWrap: true,
          itemCount: data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            mainAxisExtent: 280,
          ),
          itemBuilder: (context, index) {
            final items = data[index];
            return Card(
              elevation: 1,
              child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.5),
                        child: Image.network(
                          items["p_imgs"][0],
                          width: 200,
                          height: 150,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Spacer(),
                      Flexible(
                        child: "${items["p_name"]}".text
                            .size(18)
                            .fontFamily(bold)
                            .make(),
                      ),
                      0.5.heightBox,
                      "${items["p_price"]}".numCurrency.text
                          .fontFamily(bold)
                          .size(15)
                          .color(Vx.cyan400)
                          .make(),
                      5.heightBox,
                    ],
                  ).box.rounded
                  .padding(const EdgeInsets.all(12))
                  .white
                  .make()
                  .onTap(() {
                    Get.to(
                      () => ItemDetailsWidget(
                        itemTitle: "${items["p_name"]}",
                        itemPrice: "${items["p_price"]}",
                        itemImages: List<String>.from(items["p_imgs"]),
                        data: items,
                      ),
                    );
                  }),
            );
          },
        );
      }
    },
  );
}
