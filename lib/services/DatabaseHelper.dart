import 'dart:io';
import 'package:path/path.dart';
import '../models/Person.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

final String favTable = "favourites";
final String colId = "_id";
final String colName = "name";
final String colDob = "dob";
final String colAddress = "address";
final String colPhone = "phone";
final String colStatus = "status";
final String colPicture = "picture";

const DB_ERROR_UNKOWN = 0;
const DB_ERROR_UNIQUE = -1;
const DB_ERROR_SYNTAX = -2;

int getDBError(DatabaseException e) {
  if (e.isUniqueConstraintError()) return DB_ERROR_UNIQUE;
  if (e.isSyntaxError()) return DB_ERROR_SYNTAX;
  return DB_ERROR_UNKOWN;
}

class DatabaseHelper {
  static final _dbName = "favourite.db";
  static final _dbVersion = 1;
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _dbName);
    // Open the database. Can also add an onUpdate callback parameter.
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
              CREATE TABLE $favTable (
                $colId INTEGER PRIMARY KEY,
                $colName TEXT NOT NULL,
                $colDob TEXT NOT NULL,
                $colAddress TEXT NOT NULL,
                $colPhone TEXT NOT NULL,
                $colStatus TEXT NOT NULL,
                $colPicture TEXT NOT NULL
              )
              ''');
  }

  Future<int> insert(Person person) async {
    try {
      Database db = await database;
      int id = await db.insert(favTable, person.toMap());
      return id;
    } catch (err) {
      DatabaseException databaseException = err;
      return getDBError(databaseException);
    }
  }

  Future<int> remove(int personId) async {
    try {
      Database db = await database;
      await db.delete(favTable, where: "$colId = ?", whereArgs: [personId]);
      return 1;
    } catch (err) {
      print(err);
      DatabaseException databaseException = err;
      return getDBError(databaseException);
    }
  }

  Future<List<Person>> queryFavouriteList() async {
    Database db = await database;
    List<Map> maps = await db.query(favTable);
    List<Person> persons = new List();
    maps.forEach((element) {
      var p = Person.fromMap(element);
      persons.add(p);
    });
    // return maps.map<Person>((e) => Person.fromMap(e)).toList();
    return persons;
  }
}
