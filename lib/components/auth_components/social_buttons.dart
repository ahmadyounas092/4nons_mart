import '../../constants/export.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(socialImages.length, (index) {
          return Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blueGrey[50],
                radius: 25,
                child: Image.asset(socialImages[index], width: 30),
              ),
              const SizedBox(height: 5), // Spacing between icon and text
              Text(
                socialNames[index],
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
            ],
          );
        }),
      ),
    );
  }
}
