import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Evans' Flutter UI",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Evans' Flutter UI"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInWidget(
              child: Text(
                "Welcome to your Flutter UI showcase, Evans.",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Welcome, Evans! 🚀")),
                );
              },
              child: Text("Get Started"),
            ),
            SizedBox(height: 20),
            ImageCard(
              imageUrl: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8',
            ),
            SizedBox(height: 16),
            ImageCard(
              imageUrl: 'https://images.pexels.com/photos/177598/pexels-photo-177598.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
            ),
          ],
        ),
      ),
    );
  }
}

// ImageCard Widget with CircularProgressIndicator while loading
class ImageCard extends StatelessWidget {
  final String imageUrl;

  const ImageCard({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 300,
            height: 200,
            child: Center(child: CircularProgressIndicator()),
          ),
          FadeInWidget(
            child: Image.network(
              imageUrl,
              height: 200,
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

// Fade-in Animation Widget
class FadeInWidget extends StatefulWidget {
  final Widget child;
  const FadeInWidget({required this.child});

  @override
  _FadeInWidgetState createState() => _FadeInWidgetState();
}

class _FadeInWidgetState extends State<FadeInWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _animation, child: widget.child);
  }
}
