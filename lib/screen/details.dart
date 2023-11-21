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