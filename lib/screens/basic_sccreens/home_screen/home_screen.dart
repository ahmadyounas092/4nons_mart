import '../../../constants/export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightGrey,
      // padding: const EdgeInsets.all(12),
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(
          children: [
            // hgeader widget for home screen
            headerWidget(context),
            5.heightBox,
            Flexible(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // slider brand widget
                    sliderBrandWidget(context),
                    12.heightBox,
                    // deal buttons 1
                    dealButtons1(context),
                    12.heightBox,
                    // second slider brand widget
                    secondBrandWidget(context),
                    12.heightBox,
                    // deal buttons 2
                    dealButtons2(context),
                    2.5.heightBox,
                    // featured categories text
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child:
                            "Featured Categories".text
                                .fontFamily(bold)
                                .size(22)
                                .color(darkFontGrey)
                                .make(),
                      ),
                    ),
                    10.heightBox,
                    // featured categories widget
                    featuredCategoriesWidget(),
                    //
                    18.heightBox,
                    // featured products
                    featuredProductWidget(context),
                    12.5.heightBox,
                    // on sale widget
                    onSaleWidget(context),
                    20.heightBox,
                    // all Products Text
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child:
                            "All Products".text
                                .fontFamily(bold)
                                .size(18)
                                .make(),
                      ),
                    ),
                    10.heightBox,
                    // all products grid view widget
                    allProductsWidget(context),
                    22.5.heightBox,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
