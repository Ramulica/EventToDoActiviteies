import 'package:flutter/material.dart';

import 'package:hallowenapp/models/Challenge_.dart';
import 'package:hallowenapp/models/globals.dart' as globals;

class ChallangeRow extends StatelessWidget {
  final Challege challage;
  final database;
  Function delletChal;
  ChallangeRow(this.challage, this.database, this.delletChal);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedBackgroundColor: (challage.id % 2 == 0)
          ? const Color.fromARGB(255, 9, 0, 69)
          : const Color.fromARGB(255, 0, 48, 87),
      textColor: Colors.white,
      collapsedTextColor: Colors.white,
      backgroundColor: (challage.id % 2 == 0)
          ? const Color.fromARGB(255, 9, 0, 69)
          : const Color.fromARGB(255, 0, 48, 87),
      title: Text(challage.title,
          style: TextStyle(
            color: globals.AppColor().forgroudnColorapp,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          )),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Task completed",
            style: globals.textStyeleAppc,
          ),
          CheckboxExample(
              challage.done == 1 ? true : false, challage.id, database, false),
          Text(
            "Correct",
            style: globals.textStyeleAppc,
          ),
          CheckboxExample(challage.confirmed == 1 ? true : false, challage.id,
              database, true),
        ],
      ),
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          width: double.infinity,
          child: Text(
            challage.text,
            style: globals.textStyeleAppc,
          ),
        ),
        MyCustomForm(challage, database),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              delletChal();
            },
            child: Text(
              "Delete",
              style: TextStyle(
                color: globals.AppColor().forgroudnColorapp,
              ),
            )),
      ],
    );
  }
}

class CheckboxExample extends StatefulWidget {
  bool ischecked;
  bool confirmed;

  int id;
  final database;

  CheckboxExample(this.ischecked, this.id, this.database, this.confirmed);

  @override
  State<CheckboxExample> createState() =>
      _CheckboxExampleState(ischecked, id, database, confirmed);
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked;
  bool confirmed;

  int id;
  final database;
  _CheckboxExampleState(this.isChecked, this.id, this.database, this.confirmed);

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) async {
        setState(() {
          isChecked = value!;
        });
        Challege challenge = (await ChallegesByIndex(database, id))[0];
        if (confirmed)
          challenge.confirmed = isChecked ? 1 : 0;
        else
          challenge.done = isChecked ? 1 : 0;

        updateChallahe(challenge, database, id);
        print(await allChalleges(database));
        globals.alllist = await allChalleges(database);
      },
    );
  }
}

class MyCustomForm extends StatelessWidget {
  final Challege challenge;
  final database;

  MyCustomForm(this.challenge, this.database);

  var awnserAcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var awnserAcontroller = TextEditingController(text: challenge.awnser);
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: TextFormField(
              controller: awnserAcontroller,
              style: globals.textStyeleAppc,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: globals.AppColor().b1ackgroudnColorapp,
                )),
                focusColor: Colors.white,
                hoverColor: Colors.white,
                fillColor: Colors.white,
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: globals.AppColor().barrColorapp,
                foregroundColor: globals.AppColor().forgroudnColorapp),
            onPressed: () {
              challenge.awnser = awnserAcontroller.text;
              updateChallahe(challenge, database, challenge.id);
              print(awnserAcontroller.text);
            },
            child: const Text("Confirm"))
      ],
    );
  }
}
