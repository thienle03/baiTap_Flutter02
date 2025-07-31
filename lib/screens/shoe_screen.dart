import 'package:flutter/material.dart';
import '../models/shoe.dart';
import '../models/cart_item.dart';
import '../widgets/cart_item_widget.dart';

class ShoeStoreScreen extends StatefulWidget {
  @override
  _ShoeStoreScreenState createState() => _ShoeStoreScreenState();
}

class _ShoeStoreScreenState extends State<ShoeStoreScreen> {
  final List<Shoe> _shoes = [
    Shoe(name: 'Nike Air Max', price: 100.0, imagePath: 'assets/nike1.jpg'),
    Shoe(
      name: 'Adidas Ultra Boost',
      price: 120.0,
      imagePath: 'assets/nike2.jpg',
    ),
    Shoe(name: 'Puma Suede', price: 80.0, imagePath: 'assets/adidas2.jpg'),
    Shoe(name: 'Nike Air Maxs', price: 100.0, imagePath: 'assets/adidas.jpg'),
    Shoe(
      name: 'Adidas Ultra Boosts',
      price: 100.0,
      imagePath: 'assets/adidas3.jpg',
    ),
  ];

  final List<CartItem> _cart = [];

  void addToCart(Shoe shoe) {
    setState(() {
      final index = _cart.indexWhere((item) => item.shoe.name == shoe.name);
      if (index >= 0) {
        _cart[index].quantity++;
      } else {
        _cart.add(CartItem(shoe: shoe));
      }
    });
  }

  void removeFromCart(Shoe shoe) {
    setState(() {
      _cart.removeWhere((item) => item.shoe.name == shoe.name);
    });
  }

  double getTotal() {
    return _cart.fold(
      0.0,
      (sum, item) => sum + item.shoe.price * item.quantity,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Shoe Store'),
        backgroundColor: Colors.blue,
        elevation: 2,
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Giỏ hàng',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            flex: 2,
            child:
                _cart.isEmpty
                    ? const Center(
                      child: Text('Chưa có sản phẩm nào trong giỏ hàng.'),
                    )
                    : ListView.builder(
                      itemCount: _cart.length,
                      itemBuilder: (context, index) {
                        final item = _cart[index];
                        return CartItemWidget(
                          cartItem: item,
                          onDelete: () => removeFromCart(item.shoe),
                        );
                      },
                    ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tổng tiền:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '${getTotal().toStringAsFixed(2)}\$',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 0, 0),
                  ),
                ),
              ],
            ),
          ),

          const Divider(thickness: 1),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Danh sách giày',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _shoes.length,
              itemBuilder: (context, index) {
                final shoe = _shoes[index];
                return Container(
                  width: 180,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.asset(
                            shoe.imagePath,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            shoe.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '${shoe.price.toStringAsFixed(2)}\$',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 6, 6, 6),
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () => addToCart(shoe),
                            child: const Text("Thêm vào giỏ"),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
