import 'package:flutter/material.dart';

void main() {
  runApp(ProductListApp());
}

class ProductListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => ProductListScreen(),
        '/productDetail': (context) => ProductDetailScreen(),
      },
    );
  }
}

class ProductListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {'name': 'Hoa Baby', 'image': 'https://nhahoa.com.vn/wp-content/uploads/2022/03/Bo-Hoa-Baby-Xanh-HB046.jpg'},
    {'name': 'Hoa hồng', 'image': 'https://nhahoa.com.vn/wp-content/uploads/2021/06/Bo-Hoa-Dep-Danh-Tang-Tinh-Yeu-HB009.jpg'},
    {'name': 'Hoa Tulip', 'image': 'https://nhahoa.com.vn/wp-content/uploads/2023/03/Hoa-tuoi-83-12.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách sản phẩm'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(products[index]['image']),
            title: Text(products[index]['name']),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/productDetail',
                arguments: products[index],
              );
            },
          );
        },
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> product =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết sản phẩm'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(product['image'],
            ),
            SizedBox(height: 16),
            Text('Tên sản phẩm: ${product['name']}'),
          ],
        ),
      ),
    );
  }
}
