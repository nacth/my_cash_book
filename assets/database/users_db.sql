PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE android_metadata (locale TEXT);
INSERT INTO android_metadata VALUES('en_US');
CREATE TABLE users(
      id_user INTEGER PRIMARY KEY AUTOINCREMENT,
      username TEXT NOT NULL,
      password TEXT NOT NULL,
      createdAt TEXT NOT NULL,
      updatedAt TEXT NOT NULL,
      deletedAt TEXT NOT NULL
    );
INSERT INTO users VALUES(0,'user','5f4dcc3b5aa765d61d8327deb882cf99','2022-08-02T14:58:04.477583','2022-08-02T14:59:55.463171','2022-08-02T14:58:04.477583');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('users',0);
COMMIT;
