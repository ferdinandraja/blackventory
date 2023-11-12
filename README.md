# Assignment 2
# Explanation
## 1.What are the main differences between stateless and stateful widget in Flutter?
Stateless widgets are immutable, which means that once the stateless widgets are created, it cannot be changed. On the other hand, stateful widgets are mutable which means it can change overtime and have `State` object that manage this state.
## 2. Explain all widgets that you used in this assignment.
### in menu.dart
1. MyHomePage   : Extends the StatelessWidget class and also the home screen of the application. It contains `AppBar` and `GridView` tha contains a list of `ShopItem`
2. ShopItem     : A class that represents an item in the shop with a name, an icon, and a color. Also used to store data for each itm on the grid. 
3. ShopCard     : A widget used to display each `ShopItem` in the grid. It contains an icon and text corresponding to the `ShopItem` data.
### in main.dart
1. MyApp        : The main entry widget for the app. It has configuration of apps title and theme and also it color scheme
## 3. Explain how you implemented the checklist above step-by-step (not just following the tutorial).
1. First, I have to install flutter
2. Then, change directory to designated folder where we want to save the flutter project. After that, run 
```
flutter create <APP_NAME>
cd <APP_NAME>
```
3. Create a new file in `blackventory/lib` called `menu.dart`
4. Add this line at the beginning of `menu.dart`:
`import 'package:flutter/material.dart';`
5. Cut `MyHomePage` and `_MyHomePageState` from `main.dart` and add into `menu.dart`
6. Import `menu.dart` into `main.dart`, by add this line at the beginning of the `main.dart` :
`import 'package:shopping_list/menu.dart';`
7. Change the widget into stateless wdiget 
```
class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            ...
        );
    }
}
```
8. Add another class to add text and cards 
```
class ShopItem {
  final String name;
  final IconData icon;

  ShopItem(this.name, this.icon);
}
```
9. Add new stateless widget to display the card
```
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {Key? key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigo,
      child: InkWell(
        // Responsive touch area
        onTap: () {
          // Show a SnackBar when clicked
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("You pressed the ${item.name} button!")));
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
```