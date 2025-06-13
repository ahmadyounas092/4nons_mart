import 'package:mart_app/constants/export.dart';

Widget categoryItemWidget(BuildContext context, dynamic data) {
  final controller = Get.find<ProductController>();
  if (data.isEmpty) {
    return Center(
      child:
          "No Products Available".text
              .color(darkFontGrey)
              .fontFamily(semibold)
              .make(),
    );
  }

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 4,
        mainAxisExtent: 260,
      ),
      itemBuilder: (context, index) {
        final item = data[index].data() as Map<String, dynamic>;

        // Ensure the required fields exist
        final productName = item["p_name"] ?? "Unknown Product";
        final productPrice = item["p_price"] ?? "Unknown Price";
        final productImages = item["p_imgs"] ?? [];

        // Use the first image if available, otherwise use a placeholder
        final productImage =
            (productImages.isNotEmpty)
                ? productImages[0]
                : "https://via.placeholder.com/200";

        return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    productImage,
                    width: 200,
                    height: 160,
                    fit: BoxFit.fill,
                  ),
                ),
                const Spacer(),
                "$productName".text
                    .overflow(TextOverflow.ellipsis)
                    .color(fontGrey)
                    .size(18)
                    .fontFamily(semibold)
                    .make(),
                "$productPrice".numCurrency.text
                    .overflow(TextOverflow.ellipsis)
                    .color(fontGrey)
                    .size(15)
                    .fontFamily(semibold)
                    .make(),
                10.heightBox,
              ],
            ).box.rounded
            .margin(const EdgeInsets.symmetric(horizontal: 4))
            .white
            .outerShadowSm
            .padding(const EdgeInsets.all(8))
            .make()
            .onTap(() {
              controller.checkifFavourite(data[index]);
              Get.to(
                () => ItemDetailsWidget(
                  itemTitle: productName,
                  itemPrice: productPrice,
                  itemImages: List<String>.from(productImages),
                  data: data[index],
                ),
              );
            });
      },
    ),
  );
}
