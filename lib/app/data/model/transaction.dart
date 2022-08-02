const String tableTransactions = 'transactions';

class TransactionFields {
  static final List<String> values = [
    idTransaction,
    idUser,
    type,
    date,
    nominal,
    description,
    createdAt,
    updatedAt,
    deletedAt
  ];

  static const String idTransaction = 'id_transaction';
  static const String idUser = 'id_user';
  static const String type = 'type';
  static const String date = 'date';
  static const String nominal = 'nominal';
  static const String description = 'description';
  static const String createdAt = 'createdAt';
  static const String updatedAt = 'updatedAt';
  static const String deletedAt = 'deletedAt';
}

class TransactionModel {
  TransactionModel({
    this.idTransaction,
    required this.idUser,
    required this.type,
    required this.date,
    required this.nominal,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  final int? idTransaction;
  final int idUser;
  final String type;
  final DateTime date;
  final int nominal;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime deletedAt;

  TransactionModel copyWith({
    int? idTransaction,
    int? idUser,
    String? type,
    DateTime? date,
    int? nominal,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) {
    return TransactionModel(
      idTransaction: idTransaction ?? this.idTransaction,
      idUser: idUser ?? this.idUser,
      type: type ?? this.type,
      date: date ?? this.date,
      nominal: nominal ?? this.nominal,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      idTransaction: json[TransactionFields.idTransaction] ?? 0,
      idUser: json[TransactionFields.idUser] ?? 0,
      type: json[TransactionFields.type] ?? "",
      date: DateTime.parse(json[TransactionFields.date] ?? ""),
      nominal: json[TransactionFields.nominal] ?? 0,
      description: json[TransactionFields.description] ?? "",
      createdAt: DateTime.parse(json[TransactionFields.createdAt] ?? ""),
      updatedAt: DateTime.parse(json[TransactionFields.updatedAt] ?? ""),
      deletedAt: DateTime.parse(json[TransactionFields.deletedAt] ?? ""),
    );
  }

  @override
  String toString() {
    return '$idTransaction, $idUser, $type, $date, $nominal, $description, $createdAt, $updatedAt, $deletedAt';
  }

  Map<String, dynamic> toJson() => {
        TransactionFields.idTransaction: idTransaction,
        TransactionFields.idUser: idUser,
        TransactionFields.type: type,
        TransactionFields.date: date.toIso8601String(),
        TransactionFields.nominal: nominal,
        TransactionFields.description: description,
        TransactionFields.createdAt: createdAt.toIso8601String(),
        TransactionFields.updatedAt: updatedAt.toIso8601String(),
        TransactionFields.deletedAt: deletedAt.toIso8601String(),
      };
}
