import 'package:mart_app/constants/export.dart';

Widget onSaleWidget(BuildContext context) {
  return VxSwiper.builder(
    enableInfiniteScroll: true,
    scrollDirection: Axis.horizontal,
    enlargeCenterPage: false,
    autoPlay: false,
    height: 175,
    aspectRatio: 16 / 2,
    itemCount: onSale.length,
    itemBuilder: (context, index) {
      final image = onSale[index];
      return Image.asset(image, fit: BoxFit.fill).box.rounded
          .clip(Clip.antiAlias)
          .margin(const EdgeInsets.symmetric(horizontal: 10))
          .make();
    },
  );
}
