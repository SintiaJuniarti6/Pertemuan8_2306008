import 'package:flutter/material.dart';
import 'posts_page.dart';
import 'photos_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int selectedIndex = 0;

  final List pages = [
    const PostsPage(),
    const PhotosPage(),
  ];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: Scaffold(

        body: pages[selectedIndex],

        bottomNavigationBar: BottomNavigationBar(

          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 10,

          currentIndex: selectedIndex,

          onTap: (index) {

            setState(() {
              selectedIndex = index;
            });
          },

          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.grey,

          items: const [

            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.picture_in_picture),
              label: "Picture",
            ),
          ],
        ),
      ),
    );
  }
}