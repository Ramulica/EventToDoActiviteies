import 'package:flutter/material.dart';
import 'package:hallowenapp/pages/home_paage.dart';
import 'package:hallowenapp/pages/user_page.dart';
import 'package:hallowenapp/widgets/app_bar.dart';
import 'package:hallowenapp/pages/add_task.dart';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:hallowenapp/models/globals.dart' as globals;
import 'package:hallowenapp/models/Challenge_.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
    join(await getDatabasesPath(), 'challenge1.db'),
    onCreate: (db, version) {
      db.execute(
        'CREATE TABLE challenges(id INTEGER PRIMARY KEY, title TEXT, text TEXT, done INTEGER, confirmed INTEGER, awnser_type TEXT, image_adress TEXT, awnser TEXT)',
      );
      return db.execute(
        'CREATE TABLE users(id INTEGER PRIMARY KEY, title TEXT, image TEXT)',
      );
    },
    version: 2,
  );

  globals.alllist = await allChalleges(database);
  globals.lastindex = globals.alllist[globals.alllist.length - 1].id + 1;
  // globals.lastindex = (await allList).last.id + 1;

  runApp(MyApp(database));
}

class MyApp extends StatelessWidget {
  final database;
  MyApp(this.database);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: MyApp2(database),
        ));
  }
}

class MyApp2 extends StatelessWidget {
  final database;
  const MyApp2(this.database);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globals.AppColor().b1ackgroudnColorapp,
      appBar: AppBar(
        backgroundColor: globals.AppColor().barrColorapp,
        foregroundColor: Colors.white,
        title: const Text('Acasă'),
        bottom: TabBar(
          indicatorColor: globals.AppColor().barrColorapp,
          unselectedLabelColor: Colors.white,
          labelColor: Colors.white,
          padding: EdgeInsets.zero,
          labelPadding: EdgeInsets.zero,
          indicatorPadding: EdgeInsets.zero,
          dividerHeight: 0,
          tabs: const <Widget>[
            Tab(
              text: 'Acasă',
            ),
            Tab(
              text: "Profil",
            ),
          ],
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          Center(
            child: HomePAge(database),
          ),
          const Center(
            child: ProfilePage1(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.small(
        shape: const CircleBorder(),
        backgroundColor: globals.AppColor().barrColorapp,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyForm(database)),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
