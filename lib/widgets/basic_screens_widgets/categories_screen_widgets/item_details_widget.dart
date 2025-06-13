import 'package:mart_app/constants/export.dart';

class ItemDetailsWidget extends StatelessWidget {
  final String itemTitle;
  final String itemPrice;
  final List<String> itemImages;
  final dynamic data;

  const ItemDetailsWidget({
    super.key,
    required this.itemTitle,
    required this.itemPrice,
    required this.itemImages,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    controller.checkifFavourite(data);
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        controller.resetProductQuantity();
      },
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              controller.resetProductQuantity();
              Get.back();
            },
            icon: Icon(Icons.arrow_back),
          ),
          backgroundColor: Colors.white,
          title: itemTitle.text.fontFamily(bold).color(darkFontGrey).make(),
          iconTheme: IconThemeData(color: tealColor),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.share, color: tealColor),
            ),
            Obx(
              () => IconButton(
                onPressed: () {
                  if (controller.isFavourite.value) {
                    controller.removeFromWishList(data.id);
                    VxToast.show(context, msg: "Removed from wishlist");
                  } else {
                    controller.addtoWishList(data.id);
                    VxToast.show(context, msg: "Added to wishlist");
                  }
                  controller.checkifFavourite(data);
                },
                icon: Icon(
                  controller.isFavourite.value
                      ? Icons.favorite
                      : Icons.favorite_outline,
                  color: controller.isFavourite.value ? redColor : tealColor,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        viewportFraction: 1.0,
                        autoPlay: true,
                        autoPlayAnimationDuration: const Duration(seconds: 1),
                        autoPlayInterval: const Duration(seconds: 6),
                        height: 300,
                        itemCount: itemImages.length,
                        itemBuilder: (context, index) {
                          return Image.network(
                                itemImages[index],
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ).box
                              .customRounded(BorderRadius.circular(12.5))
                              .margin(EdgeInsets.symmetric(horizontal: 12))
                              .clip(Clip.antiAlias)
                              .make();
                        },
                      ),
                    ),
                    7.5.heightBox,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child:
                          itemTitle.text
                              .size(18)
                              .color(darkFontGrey)
                              .fontFamily(bold)
                              .make(),
                    ),
                    5.heightBox,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: VxRating(
                        onRatingUpdate: (value) {},
                        isSelectable: false,
                        value: double.parse(data["p_rating"]),
                        normalColor: textfieldGrey,
                        selectionColor: golden,
                        count: 5,
                        maxRating: 5,
                        size: 22.5,
                        stepInt: true,
                      ),
                    ),
                    5.heightBox,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child:
                          itemPrice.numCurrency.text
                              .color(indigoColor)
                              .fontFamily(bold)
                              .size(18)
                              .make(),
                    ),
                    5.heightBox,
                    sellerSection(context, data),
                    colorQuantityTotal(context, data),
                    10.heightBox,
                    descriptionSection(data),
                    10.heightBox,
                    suggestionButtons(context),
                    5.heightBox,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child:
                          "Products you may also like".text
                              .size(18)
                              .fontFamily(bold)
                              .color(redColor)
                              .make(),
                    ),
                    mayLikeProducts(context),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: SizedBox(
                    child: MyButton(
                      padding: const EdgeInsets.all(12.5),
                      width: double.infinity,
                      buttonColor: orangeColor,
                      onTap: () {
                        var pColors = data["p_colors"];
                        var colorValue;

                        if (pColors is List) {
                          colorValue = pColors[controller.colorIndex.value];
                        } else {
                          colorValue = pColors;
                        }

                        int colorInt;

                        if (colorValue is String) {
                          try {
                            colorInt = int.parse(colorValue);
                          } catch (e) {
                            print("Invalid color String: $colorValue");
                            colorInt = 0xffffffff;
                          }
                        } else if (colorValue is int) {
                          colorInt = colorValue;
                        } else {
                          print("Invalid color type: $colorValue");
                          colorInt = 0xffffffff;
                        }

                        controller.addToCart(
                          title: data["p_name"],
                          image: data["p_imgs"][0],
                          sellerName: data["p_seller"],
                          color: colorInt,
                          quantity: controller.quantity.value,
                          totalPrice: controller.totalPrice.value,
                          vendorId: data["vendor_id"],
                          context: context,
                        );
                      },
                      buttonName: "Add to cart",
                      style: const TextStyle(
                        color: whiteColor,
                        fontFamily: bold,
                        fontSize: 18,
                      ),
                      borderRadius: BorderRadius.circular(12.5),
                    ),
                  ),
                ),
              ],
            ).paddingOnly(left: 5, right: 5, bottom: 2.5, top: 2.5),
          ],
        ),
      ),
    );
  }
}
