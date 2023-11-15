# Assignment 7
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

# Assignment 8
# Explanation
## 1. Explain the difference between Navigator.push() and Navigator.pushReplacement(), accompanied by examples of the correct usage of both methods!
In `Navigator.push()`, once it is click it pushes a new route onto the navigator's stack. his means that a new screen is added on top of the existing stack of screens. The user can navigate back to the previous screen using the back button. On the other hand, `Navigator.pushreplacement()`, it replace the top of the stach with the screen that is being push, such that the previous screen is remove from the stack.
## 2. Explain each layout widget in Flutter and their respective usage contexts!
1. Form : To create and handle user input for form.
2. Drawer: To create a navigation bar
3. AlertDialog : To notify the user about some error or unexpected case.
4. TextFormField : For user input in text
## 3. List the form input elements you used in this assignment and explain why you used these input elements!
`TextFormField` which is used to create text field and can be validate.
## 4. How is clean architecture implemented in a Flutter application?
In flutter, the application is divided by into three, which is presentation, domain, and data. In presentation, it handles the frontend and UI of the application. In domain, it handles the data processing from the data layer to the presentation layer. In data layer, it responsibles for data storage.
## 5. Step by step
1.  Create a new page called `shop_listform.dart` that will become a page where user will give it inputs for adding an item. To create this page. Don't forget to add the form by adding a new class and create the form using `Scaffold`. Use `TextFormField` for user text input and `AlertDialog` for unexpected case. After that, don't forget to do the routing in the `menu.dart`
2.  Create a left drawer by create a new file named `left_drawer.dart`. Use `Navigaor.pushReplacement()` for button that is pressed in the left drawer. Don't forget to add the routing for the button
3. Do routing for home button in the drawe, don't forget to also use `Navigaor.pushReplacement()`.