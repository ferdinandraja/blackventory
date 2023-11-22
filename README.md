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

# Assignment 9
<details>
<summary>1. Can we retrieve JSON data without creating a model first? If yes, is it better than creating a model before retrieving JSON data?</summary>
Yes we can retrieve JSON data without creating a model first. It is better to create a model for more complex task as it helps you regarding the constraint of data type.</details>
<details>
<summary>
2. Explain the function of CookieRequest and explain why a CookieRequest instance needs to be shared with all components in a Flutter application.</summary>
CookieRequest is used to save the cookies from the django project. For this case, it is needed to be shared with all components in a flutter application because if you want to change the scree, you still need to be log in, which is stored in CookieRequest.</details>
<details><summary>
3.  Explain the mechanism of fetching data from JSON until it can be displayed on Flutter.</summary>
Fetching JSON data to Flutter is using http library to fetch the data, and using the dart:convert library.</details>
<details><summary>
4. Explain the authentication mechanism from entering account data on Flutter to Django authentication completion and the display of menus on Flutter.</summary>
First, create the login page. Than use pbp_django_auth to give a request to login, so that we can use the cookies for login.</details>

### 5. List all the widgets you used in this assignment and explain their respective functions.
- `FutureBuilder` for constructing a widget contingent on an asynchronous state.
- `ListView` for presenting children in a list layout.
- `GestureDetector` to recognize gestures on a widget.
- `TextFormField` for accepting user text input.
- `ElevatedButton` for generating a button.
- `Container` to encapsulate a widget.

### 6. STEP BY STEP:
A. Create a new django app named `authentication`. Don't forget to create a view, a routing, and all dependencies for login authentication, such as
```
from django.shortcuts import render
from django.contrib.auth import authenticate, login as auth_login
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Successful login status.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login successful!"
                # Add other data if you want to send data to Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login failed, account disabled."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login failed, check email or password again."
        }, status=401)
```
in the views.py
B. Create a new page name `login.dart` and create a routing from `menu.dart`
C. Create view product screen to connect the django to `list_product.dart`:
```
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:blackventory/models/product.dart';
import 'package:blackventory/widgets/left_drawer.dart';
import 'package:blackventory/screen/details.dart';
class ProductPage extends StatefulWidget {
    const ProductPage({Key? key}) : super(key: key);

    @override
    _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
Future<List<Product>> fetchProduct() async {
    // TODO: Change the URL to your Django app's URL. Don't forget to add the trailing slash (/) if needed.
    var url = Uri.parse(
        'http://127.0.0.1:8000/json/');
    var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
    );

    // decode the response to JSON
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // convert the JSON to Product object
    List<Product> list_product = [];
    for (var d in data) {
        if (d != null) {
            list_product.add(Product.fromJson(d));
        }
    }
    return list_product;
}

@override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Product'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchProduct(),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            "No product data available.",
                            style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                        product: snapshot.data![index])));
                          },
                          child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                    "${snapshot.data![index].fields.name}",
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text("${snapshot.data![index].fields.price}"),
                                    const SizedBox(height: 10),
                                    Text("${snapshot.data![index].fields.amount}"),
                                    const SizedBox(height: 10),
                                    Text(
                                        "${snapshot.data![index].fields.description}")
                                ],
                                ),
                            )));
                    }
                }
            }));
    }
}
```
D. Create logout page, in django views.py and then rout it with the `shop_card.dart`
E. Add new screen named `details.dart`:
```
import 'package:flutter/material.dart';
import 'package:blackventory/models/product.dart';
import 'package:blackventory/widgets/left_drawer.dart';

class DetailPage extends StatelessWidget {
  final Product product;

  const DetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.fields.name,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text("Amount:\n${product.fields.amount}"),
            const SizedBox(height: 20),
            Text("Price:\n${product.fields.price}"),
            const SizedBox(height: 20),
            Text("Description:\n${product.fields.description}"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to the item list page
              },
              child: const Text('Back to Item List'),
            ),
          ],
        ),
      ),
    );
  }
}
```
