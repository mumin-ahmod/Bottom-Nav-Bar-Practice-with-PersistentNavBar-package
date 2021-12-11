import 'package:botnav_pract/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Bottom Nav'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.settings),
        title: ("Settings"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.book), title: "books"),
      PersistentBottomNavBarItem(
        title: "read",
        icon: Container(
          height: 28,
          width: 28,
          child: SvgPicture.asset(
            "read-book.svg",
            semanticsLabel: 'A red up arrow',
            color: Colors.grey,
          ),
        ),
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(icon: Icon(CupertinoIcons.bookmark_solid)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PersistentTabView(
        context,
        screens: [
          Container(
            color: Colors.red,
          ),
          SettingsPage(),
          Container(
            color: Colors.red,
          ),
          Container(color: Colors.blue),
          Container(
            color: Colors.red,
          ),
        ],
        items: _navBarsItems(),
        confineInSafeArea: true,
        navBarStyle: NavBarStyle.style9,


      ),
    );
  }
}
