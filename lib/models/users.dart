import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:hallowenapp/models/globals.dart' as globals;

class AppUser {
  int id = 0;
  String name;
  String image;

  AppUser({
    required this.id,
    required this.name,
    required this.image,
  });
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'users{id: $id, name: $name, image: $image}';
  }
}

Future<void> insertUser(AppUser challenge, database) async {
  // Get a reference to the database.
  final db = await database;

  // Insert the Dog into the correct table. You might also specify the
  // `conflictAlgorithm` to use in case the same dog is inserted twice.
  //
  // In this case, replace any previous data.
  await db.insert(
    'users',
    challenge.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<AppUser>> allChalleges(database) async {
  // Get a reference to the database.
  final db = await database;

  // Query the table for all the dogs.
  final List<Map<String, Object?>> dogMaps = await db.query('users');

  // Convert the list of each dog's fields into a list of `Dog` objects.
  return [
    for (final {
          'id': id as int,
          'nzmd': name as String,
          'image': image as String,
        } in dogMaps)
      AppUser(
        id: id,
        name: name,
        image: image,
      ),
  ];
}

Future<void> updateChallahe(AppUser challenge, database, index) async {
  // Get a reference to the database.
  final db = await database;
  challenge.id = index;
  // Insert the Dog into the correct table. You might also specify the
  // `conflictAlgorithm` to use in case the same dog is inserted twice.
  //
  // In this case, replace any previous data.
  await db.insert(
    'users',
    challenge.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<AppUser>> ChallegesByIndex(database) async {
  // Get a reference to the database.
  final db = await database;

  // Query the table for all the dogs.
  final List<Map<String, Object?>> dogMaps =
      await db.query('users', where: 'id = ?', whereArgs: [1]);

  // Convert the list of each dog's fields into a list of `Dog` objects.
  return [
    for (final {
          'id': id as int,
          'name': name as String,
          'image': image as String,
        } in dogMaps)
      AppUser(id: id, image: image, name: name),
  ];
}

Future<void> deleteChallenge(int id, database) async {
  // Get a reference to the database.
  final db = await database;

  // Remove the Dog from the database.
  await db.delete(
    'users',
    // Use a `where` clause to delete a specific dog.
    where: 'id = ?',
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [id],
  );
}
