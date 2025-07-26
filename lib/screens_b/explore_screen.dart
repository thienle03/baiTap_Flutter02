import 'package:flutter/material.dart';
import 'homecart_screen.dart';

class ExploreScreen extends StatelessWidget {
  final List<String> products = ['Lamp', 'Car', 'Plant'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A2A44),
      appBar: AppBar(
        title: Text(
          'Explore',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 30,
          ),
        ),
        backgroundColor: Color(0xFF1A2A44),
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(backgroundColor: Colors.orange),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Find products easier here',
              style: TextStyle(
                color: Color.fromARGB(179, 229, 227, 227),
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => HomeCartScreen()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 20.0,
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16.0),
                          ),
                          child: Container(
                            height: 150,
                            color: Color(0xFF4ECDC4),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.photo_library,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Image Here',
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(16.0),
                            ),
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            products[index],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
