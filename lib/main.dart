import 'package:flutter/material.dart';

// Profile page
import 'package:flutterapp/profile_page.dart';
import 'package:flutterapp/random_person.dart';

// Home page
import 'home_page.dart';

void main(List<String> args) {
  runApp(const FlutterApp());
}

class FlutterApp extends StatelessWidget {
  const FlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RootPage(),
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _HomePageState();
}

class _HomePageState extends State<RootPage> {
  int currentPage = 0;

  List<Widget> pages = const [
    HomePage(),
    ProfilePage(),
    RandomPerson(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: pages[currentPage],
      floatingActionButton: FloatingActionButton(
        onPressed: (() {}),
        child: const Icon(
          Icons.add,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
              icon: Icon(
                Icons.add,
              ),
              label: "Home"),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
          NavigationDestination(
            icon: Icon(Icons.accessible),
            label: "Random person",
          ),
        ],
        onDestinationSelected: ((int index) {
          setState(() {
            currentPage = index++;
          });
        }),
        selectedIndex: currentPage,
      ),
    );
  }
}
