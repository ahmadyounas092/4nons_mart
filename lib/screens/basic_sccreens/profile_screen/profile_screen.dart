import '../../../constants/export.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // profile photo and name section for the profile screen\
                profileNameSection(context),
                12.heightBox,
                // cart, whishlist and the order section here
                cartWishlistOrderSection(context),
                // profile screen buttons
                profileButtons(context).box
                    .color(redColor)
                    .padding(const EdgeInsets.only(top: 40, bottom: 40))
                    .make(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
