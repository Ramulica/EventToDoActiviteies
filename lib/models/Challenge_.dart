import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:hallowenapp/models/globals.dart' as globals;

class Challege {
  int id;
  String title;

  String awnser_type;
  String image_adress;
  String awnser;

  String text;
  int done;
  int confirmed;

  Challege({
    required this.id,
    required this.title,
    required this.text,
    required this.done,
    required this.confirmed,
    required this.awnser_type,
    required this.image_adress,
    required this.awnser,
  });
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'title': title,
      'text': text,
      "done": done,
      "confirmed": confirmed,
      "awnser_type": awnser_type,
      "image_adress": image_adress,
      'awnser': awnser,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'challenges{id: $id, title: $title, text: $text ,done: $done, confirmed: $confirmed, awnser_type: $awnser_type, image_adress: $image_adress, awnser: $awnser}';
  }
}

Future<void> insertChallahe(Challege challenge, database) async {
  // Get a reference to the database.
  final db = await database;

  // Insert the Dog into the correct table. You might also specify the
  // `conflictAlgorithm` to use in case the same dog is inserted twice.
  //
  // In this case, replace any previous data.
  await db.insert(
    'challenges',
    challenge.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Challege>> allChalleges(database) async {
  // Get a reference to the database.
  final db = await database;

  // Query the table for all the dogs.
  final List<Map<String, Object?>> dogMaps = await db.query('challenges');

  // Convert the list of each dog's fields into a list of `Dog` objects.
  return [
    for (final {
          'id': id as int,
          'title': title as String,
          'text': text as String,
          'done': done as int,
          'confirmed': confirmed as int,
          'awnser_type': awnser_type as String,
          'image_adress': image_adress as String,
          'awnser': awnser as String,
        } in dogMaps)
      Challege(
          id: id,
          title: title,
          text: text,
          done: done,
          confirmed: confirmed,
          awnser_type: awnser_type,
          image_adress: image_adress,
          awnser: awnser),
  ];
}

Future<void> updateChallahe(Challege challenge, database, index) async {
  // Get a reference to the database.
  final db = await database;
  challenge.id = index;
  // Insert the Dog into the correct table. You might also specify the
  // `conflictAlgorithm` to use in case the same dog is inserted twice.
  //
  // In this case, replace any previous data.
  await db.insert(
    'challenges',
    challenge.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Challege>> ChallegesByIndex(database, id) async {
  // Get a reference to the database.
  final db = await database;

  // Query the table for all the dogs.
  final List<Map<String, Object?>> dogMaps =
      await db.query('challenges', where: 'id = ?', whereArgs: [id]);

  // Convert the list of each dog's fields into a list of `Dog` objects.
  return [
    for (final {
          'id': id as int,
          'title': title as String,
          'text': text as String,
          'done': done as int,
          'confirmed': confirmed as int,
          'awnser_type': awnser_type as String,
          'image_adress': image_adress as String,
          'awnser': awnser as String,
        } in dogMaps)
      Challege(
          id: id,
          title: title,
          text: text,
          done: done,
          confirmed: confirmed,
          awnser_type: awnser_type,
          image_adress: image_adress,
          awnser: awnser),
  ];
}

Future<void> deleteChallenge(int id, database) async {
  // Get a reference to the database.
  final db = await database;

  // Remove the Dog from the database.
  await db.delete(
    'challenges',
    // Use a `where` clause to delete a specific dog.
    where: 'id = ?',
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [id],
  );
}

int getScore() {
  int score = 0;
  for (Challege item in globals.alllist) {
    if (item.confirmed == 1) score += 5;
    ;
  }

  return score;
}
