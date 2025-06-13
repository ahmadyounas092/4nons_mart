import 'package:mart_app/constants/export.dart';

Widget secondBrandWidget(BuildContext context) {
  return VxSwiper.builder(
    autoPlay: false,
    height: 185,
    scrollDirection: Axis.horizontal,
    enableInfiniteScroll: true,
    itemCount: secondBrandList.length,
    itemBuilder: (context, index) {
      final image = secondBrandList[index];
      return Image.asset(image, fit: BoxFit.fill).box.rounded
          .clip(Clip.antiAlias)
          .margin(const EdgeInsets.symmetric(horizontal: 7.5))
          .make();
    },
  );
}
