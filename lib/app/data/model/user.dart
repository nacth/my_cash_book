const String tableUsers = 'users';

class UserFields {
  static final List<String> values = [
    idUser,
    username,
    password,
    createdAt,
    updatedAt,
    deletedAt
  ];

  static const String idUser = 'id_user';
  static const String username = 'username';
  static const String password = 'password';
  static const String createdAt = 'createdAt';
  static const String updatedAt = 'updatedAt';
  static const String deletedAt = 'deletedAt';
}

class UserModel {
  UserModel({
    required this.idUser,
    required this.username,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  final int idUser;
  final String username;
  final String password;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime deletedAt;

  UserModel copyWith({
    int? idUser,
    String? username,
    String? password,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) {
    return UserModel(
      idUser: idUser ?? this.idUser,
      username: username ?? this.username,
      password: password ?? this.password,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      idUser: json[UserFields.idUser] ?? 0,
      username: json[UserFields.username] ?? "",
      password: json[UserFields.password] ?? "",
      createdAt: DateTime.parse(json[UserFields.createdAt] ?? ""),
      updatedAt: DateTime.parse(json[UserFields.updatedAt] ?? ""),
      deletedAt: DateTime.parse(json[UserFields.deletedAt] ?? ""),
    );
  }

  @override
  String toString() {
    return '$idUser, $username, $password, $createdAt, $updatedAt, $deletedAt';
  }

  Map<String, dynamic> toJson() => {
        UserFields.idUser: idUser,
        UserFields.username: username,
        UserFields.password: password,
        UserFields.createdAt: createdAt.toIso8601String(),
        UserFields.updatedAt: updatedAt.toIso8601String(),
        UserFields.deletedAt: deletedAt.toIso8601String(),
      };
}
