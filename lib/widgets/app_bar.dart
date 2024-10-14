import 'package:flutter/material.dart';

class AppBar1 extends StatelessWidget {
  const AppBar1({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 0, 153, 51),
      foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
      title: const Text('Acasă'),
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      bottom: const TabBar(
        indicatorColor: Color.fromARGB(255, 0, 79, 26),
        unselectedLabelColor: Colors.white,
        labelColor: Colors.white,
        padding: EdgeInsets.zero,
        labelPadding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        dividerHeight: 0,
        tabs: <Widget>[
          Tab(
            text: 'Acasă',
            icon: ImageIcon(
              AssetImage("Images/Home_Page.ico"),
              size: 28,
            ),
          ),
          Tab(
            text: "Titluri tarifare",
            icon: ImageIcon(AssetImage("Images/Tags.ico")),
          ),
        ],
      ),
    );
  }
}
