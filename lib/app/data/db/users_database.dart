import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:crypto/crypto.dart';
import 'package:sqflite/sqflite.dart';
import 'package:my_cash_book/app/data/model/user.dart';

class UsersDatabase {
  static final UsersDatabase instance = UsersDatabase._init();

  static Database? _database;

  UsersDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('users.db');
    
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    const initUsername = 'user';
    final initPassword = md5.convert(utf8.encode('user')).toString();

    await db.execute('''
    CREATE TABLE $tableUsers(
      ${UserFields.idUser} $idType,
      ${UserFields.username} $textType,
      ${UserFields.password} $textType,
      ${UserFields.createdAt} $textType,
      ${UserFields.updatedAt} $textType,
      ${UserFields.deletedAt} $textType
    )
    ''');

    final date = DateTime.now();

    await db.insert(
      tableUsers,
      UserModel(
        idUser: 0,
        username: initUsername,
        password: initPassword,
        createdAt: date,
        updatedAt: date,
        deletedAt: date,
      ).toJson(),
    );
  }

  Future<UserModel?> login(String username, String password) async {
    final db = await instance.database;

    final result = await db.query(
      tableUsers,
      where: '${UserFields.username} = ? AND ${UserFields.password} = ?',
      whereArgs: [username, password],
    );

    if (result.isNotEmpty) {
      return UserModel.fromJson(result.first);
    } else {
      return null;
    }
  }

  Future<UserModel> create(UserModel user) async {
    final db = await instance.database;

    final id = await db.insert(tableUsers, user.toJson());

    return user.copyWith(idUser: id);
  }

  Future<UserModel> readUser(int idUser) async {
    final db = await instance.database;

    final maps = await db.query(
      tableUsers,
      columns: UserFields.values,
      where: '${UserFields.idUser} = ?',
      whereArgs: [idUser],
    );

    if (maps.isNotEmpty) {
      return UserModel.fromJson(maps.first);
    } else {
      throw Exception('ID $idUser not found');
    }
  }

  Future<List<UserModel>> readAllUsers() async {
    final db = await instance.database;

    const orderBy = '${UserFields.createdAt} ASC';

    final result = await db.query(tableUsers, orderBy: orderBy);

    return result.map((json) => UserModel.fromJson(json)).toList();
  }

  Future<int> update(UserModel user) async {
    final db = await instance.database;

    return db.update(
      tableUsers,
      user.toJson(),
      where: '${UserFields.idUser} = ?',
      whereArgs: [user.idUser],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableUsers,
      where: '${UserFields.idUser} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
