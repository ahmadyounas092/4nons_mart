import '../../../constants/export.dart';

Widget cartWishlistOrderSection(BuildContext context) {
  return StreamBuilder<List<int>>(
    stream: FirestoreServices.getUserCounts(), // Use the stream function
    builder: (context, AsyncSnapshot<List<int>> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(redColor),
          ),
        );
      } else if (snapshot.hasError || snapshot.data == null) {
        return const Center(child: Text("Failed to load data."));
      }

      final cartCount = snapshot.data?[0] ?? 0;
      final wishlistCount = snapshot.data?[1] ?? 0;
      final orderCount = snapshot.data?[2] ?? 0;

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ProfileCartButton(value: "$cartCount", title: "in your cart"),
            ProfileCartButton(value: "$wishlistCount", title: "in your wishlist"),
            ProfileCartButton(value: "$orderCount", title: "you ordered"),
          ],
        ),
      );
    },
  );
}