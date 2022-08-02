// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:my_cash_book/app/data/model/transaction.dart';

class TransactionsDatabase {
  static final TransactionsDatabase instance = TransactionsDatabase._init();

  static Database? _database;

  TransactionsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('transactions.db');

    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const integerType = 'INTEGER NOT NULL';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE $tableTransactions(
      ${TransactionFields.idTransaction} $idType,
      ${TransactionFields.idUser} $integerType,
      ${TransactionFields.type} $textType,
      ${TransactionFields.date} $textType,
      ${TransactionFields.nominal} $integerType,
      ${TransactionFields.description} $textType,
      ${TransactionFields.createdAt} $textType,
      ${TransactionFields.updatedAt} $textType,
      ${TransactionFields.deletedAt} $textType
    )
    ''');
  }

  Future<Map<String, Object?>?> getSummaryMonth(String type) async {
    final db = await instance.database;

    const query = '''
    SELECT SUM(
      ${TransactionFields.nominal}
    ) AS nominal
    FROM $tableTransactions
    WHERE ${TransactionFields.type} = ?
    AND ${TransactionFields.date}
    >= ${TransactionFields.date}('now','start of month')
    ''';
    final result = await db.rawQuery(query, [type]);

    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, Object?>>?> getChartData(String type) async {
    final db = await instance.database;

    const query = '''
    SELECT ${TransactionFields.date},
    SUM(${TransactionFields.nominal}) AS nominal
    FROM $tableTransactions
    WHERE ${TransactionFields.type} = ?
    AND ${TransactionFields.date}
    >= ${TransactionFields.date}('now','start of month')
    GROUP BY ${TransactionFields.date}
    ORDER BY ${TransactionFields.date} ASC
    ''';
    final result = await db.rawQuery(query, [type]);

    if (result.isNotEmpty) {
      return result;
    } else {
      return null;
    }
  }

  Future<TransactionModel> create(TransactionModel transaction) async {
    final db = await instance.database;

    final id = await db.insert(tableTransactions, transaction.toJson());

    return transaction.copyWith(idTransaction: id);
  }

  Future<TransactionModel> readTransaction(int idTransaction) async {
    final db = await instance.database;

    final maps = await db.query(
      tableTransactions,
      columns: TransactionFields.values,
      where: '${TransactionFields.idTransaction} = ?',
      whereArgs: [idTransaction],
    );

    if (maps.isNotEmpty) {
      return TransactionModel.fromJson(maps.first);
    } else {
      throw Exception('ID $idTransaction not found');
    }
  }

  Future<List<TransactionModel>> readAllTransactions() async {
    final db = await instance.database;

    const orderBy = '${TransactionFields.date} DESC';

    final result = await db.query(tableTransactions, orderBy: orderBy);

    return result.map((json) => TransactionModel.fromJson(json)).toList();
  }

  Future<int> update(TransactionModel transaction) async {
    final db = await instance.database;

    return db.update(
      tableTransactions,
      transaction.toJson(),
      where: '${TransactionFields.idTransaction} = ?',
      whereArgs: [transaction.idTransaction],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableTransactions,
      where: '${TransactionFields.idTransaction} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
