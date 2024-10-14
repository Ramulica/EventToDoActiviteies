import 'package:flutter/material.dart';
import 'package:hallowenapp/models/globals.dart' as globals;
import 'package:hallowenapp/models/Challenge_.dart';
import 'package:hallowenapp/widgets/dropDown.dart';

class HomePAge extends StatefulWidget {
  final database;
  const HomePAge(this.database);

  @override
  State<HomePAge> createState() => _HomePAgeState(database);
}

class _HomePAgeState extends State<HomePAge> {
  final database;
  _HomePAgeState(this.database);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (var challange in globals.alllist)
            ChallangeRow(challange, database, () async {
              deleteChallenge(challange.id, database);
              final x = await allChalleges(database);
              setState(() {
                globals.alllist = x;
              });
            })
        ],
      ),
    );
  }
}
