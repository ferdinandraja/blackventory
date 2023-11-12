import 'package:blackventory/screen/shoplist_form.dart';
import 'package:flutter/material.dart';
class ShopItem {
  final String name;
  final IconData icon;
  final Color color;
  ShopItem(this.name, this.icon, this.color);
}
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {Key? key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Responsive touch area
        onTap: () {
    // Show SnackBar when clicked
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
          content: Text("You pressed the ${item.name} button!")));

    // Navigate to the appropriate route (depending on the button type)
    if (item.name == "Add Item") {
      // TODO: Use Navigator.push to navigate to a MaterialPageRoute that encompasses ShopFormPage.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ShopFormPage(),
        ));
    }
  },
        child: Container(
          // Container to hold Icon and Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}