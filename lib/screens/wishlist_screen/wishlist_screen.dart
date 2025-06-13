import '../../constants/export.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        title:
            "My Wishlist".text.color(darkFontGrey).fontFamily(semibold).make(),
        iconTheme: IconThemeData(color: darkFontGrey),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getAllWishlist(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              ),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return "No wishlist items".text
                .fontFamily(semibold)
                .color(darkFontGrey)
                .makeCentered();
          } else {
            var data = snapshot.data!.docs;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(12.5),
                    child: Image.network(
                      "${data[index]['p_imgs'][0]}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  title:
                      "${data[index]["p_name"]}".text
                          .fontFamily(semibold)
                          .size(16)
                          .make(),
                  subtitle:
                      "${data[index]["p_price"]}".numCurrency.text
                          .fontFamily(semibold)
                          .color(tealColor)
                          .make(),
                  trailing: Icon(Icons.favorite, color: redColor).onTap(
                    () async {
                      await firestore
                          .collection(productsCollection)
                          .doc(data[index].id)
                          .set({
                            "p_wishlist": FieldValue.arrayRemove([
                              currentUser!.uid,
                            ]),
                          }, SetOptions(merge: true));
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
