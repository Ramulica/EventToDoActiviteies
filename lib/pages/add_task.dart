import 'package:flutter/material.dart';
import 'package:hallowenapp/models/Challenge_.dart';
import 'package:hallowenapp/models/globals.dart' as globals;
import 'package:hallowenapp/main.dart';

List<String> list = <String>[
  'Image',
  'Text',
];

int index = 0;

class MyForm extends StatefulWidget {
  final database;
  MyForm(this.database);
  @override
  _MyFormState createState() => _MyFormState(database);
}

class _MyFormState extends State<MyForm> {
  final database;
  _MyFormState(this.database);

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // A key for managing the form
  String _name = ''; // Variable to store the entered name
  String _problem = '';
  String _awnser = 'Image'; // Variable to store the entered email
  // Variable to store the entered email

  void _submitForm() async {
    // Check if the form is valid
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Save the form data
      _awnser = list[index];
      // You can perform actions with the form data here and extract the details
      print('Name: $_name'); // Print the name
      print('Email: $_problem'); // Print the email
      print('Email: $_awnser'); // Print the email

      insertChallahe(
          Challege(
              id: globals.lastindex,
              title: _name,
              text: _problem,
              done: 0,
              confirmed: 0,
              awnser_type: _awnser,
              image_adress: "",
              awnser: ""),
          database);
      globals.lastindex += 1;

      globals.alllist = await allChalleges(database);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyApp(database)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add challenge'),
        backgroundColor: const Color.fromARGB(255, 153, 74, 0),
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey, // Associate the form key with this Form widget
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Title'), // Label for the name field
                validator: (value) {
                  // Validation function for the name field
                  if (value!.isEmpty) {
                    return 'Please enter title.'; // Return an error message if the name is empty
                  }
                  return null; // Return null if the name is valid
                },
                onSaved: (value) {
                  _name = value!; // Save the entered name
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Challange'), // Label for the email field
                validator: (value) {
                  // Validation function for the email field
                  if (value!.isEmpty) {
                    return 'Please enter the Challange.'; // Return an error message if the email is empty
                  }
                  // You can add more complex validation logic here
                  return null; // Return null if the email is valid
                },
                onSaved: (value) {
                  _problem = value!; // Save the entered email
                },
              ),
              DropdownButtonExample(_awnser),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed:
                    _submitForm, // Call the _submitForm function when the button is pressed
                child: Text('Submit'), // Text on the button
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  String awnser;
  DropdownButtonExample(this.awnser);

  @override
  State<DropdownButtonExample> createState() =>
      _DropdownButtonExampleState(awnser);
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String awnser;
  _DropdownButtonExampleState(this.awnser);
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          awnser = value!;
          dropdownValue = awnser;
          if (awnser == "Image") {
            index = 0;
          } else if (awnser == "Text") {
            index = 1;
          }
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
