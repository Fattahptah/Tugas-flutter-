import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      routes: {
        '/cart': (context) => CartPage(),
        '/checkout_page': (context) => CheckoutPage(),
        '/splash': (context) => SplashScreen(),
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.jpeg', width: 200, height: 200),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/cart');
              },
              child: Text('Welcome To Food Ordering',
                  style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryItem(
                    imagePath:
                        'assets/burger.jpeg', // Replace with your image path
                    label: 'All',
                    selected: true,
                  ),
                  CategoryItem(
                    imagePath: 'assets/burger.jpeg',
                    label: 'Makanan',
                    selected: false,
                  ),
                  CategoryItem(
                    imagePath: 'assets/teh.jpeg',
                    label: 'Minuman',
                    selected: false,
                  ),
                ],
              ),
            ),
          ),
          // Food Grid Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'All Food',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                itemCount: 6, // Number of items in the grid
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(
                    imagePath: 'assets/burger.jpeg',
                    name: 'Burger King Medium',
                    price: 'Rp. 50,000.00',
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, 
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/checkout_page');
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(Icons.shopping_cart),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Color.fromARGB(255, 255, 0, 0),
                    child: Text(
                      '3',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: '',
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String imagePath;
  final String label;
  final bool selected;

  const CategoryItem({
    required this.imagePath,
    required this.label,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: selected ? Colors.blue : Colors.grey[300],
              // color: Colors.amber,
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              border: Border.all(width: 5, color: Colors.pink),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String price;

  const ProductCard({
    required this.imagePath,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Text(price),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_circle, color: Colors.green),
          ),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout Page'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Cart',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  CheckoutItem(
                      imagePath: 'assets/burger.jpeg',
                      name: 'Burger King Medium',
                      price: 'Rp. 50,000.00',
                      quantity: 1),
                  CheckoutItem(
                      imagePath: 'assets/burger.jpeg',
                      name: 'Burger King Small',
                      price: 'Rp. 25,000.00',
                      quantity: 2),
                  CheckoutItem(
                      imagePath: 'assets/teh.jpeg',
                      name: 'Teh Botol',
                      price: 'Rp. 10,000.00',
                      quantity: 1),
                ],
              ),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Ringkasan Belanja'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('PPN 11%'),
                Text('Rp.10.000,00')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Belanja'),
                Text('Rp.94.000,00')
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('Rp. 104,000.00',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 242, 126, 165),
                  padding: EdgeInsets.symmetric(vertical: 15)),
              child: Center(
                  child: Text('Checkout', style: TextStyle(fontSize: 16))),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckoutItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final String price;
  final int quantity;

  const CheckoutItem(
      {required this.imagePath,
      required this.name,
      required this.price,
      required this.quantity,
      });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Image.asset(imagePath, width: 80, height: 80, fit: BoxFit.cover),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(price),
                Text('Quantity: $quantity'),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
    );
  }
}