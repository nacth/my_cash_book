PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE android_metadata (locale TEXT);
INSERT INTO android_metadata VALUES('en_US');
CREATE TABLE transactions(
      id_transaction INTEGER PRIMARY KEY AUTOINCREMENT,
      id_user INTEGER NOT NULL,
      type TEXT NOT NULL,
      date TEXT NOT NULL,
      nominal INTEGER NOT NULL,
      description TEXT NOT NULL,
      createdAt TEXT NOT NULL,
      updatedAt TEXT NOT NULL,
      deletedAt TEXT NOT NULL
    );
INSERT INTO transactions VALUES(1,0,'in','2022-08-01T00:00:00.000',50000,'DIKSI 1','2022-08-02T14:58:32.225477','2022-08-02T14:58:32.225477','2022-08-02T14:58:32.225477');
INSERT INTO transactions VALUES(2,0,'in','2022-08-02T00:00:00.000',100000,'DIKSI 2','2022-08-02T14:58:47.209133','2022-08-02T14:58:47.209133','2022-08-02T14:58:47.209133');
INSERT INTO transactions VALUES(3,0,'out','2022-08-01T00:00:00.000',50000,'DIKSI 1','2022-08-02T14:59:04.596473','2022-08-02T14:59:04.596473','2022-08-02T14:59:04.596473');
INSERT INTO transactions VALUES(4,0,'out','2022-08-02T00:00:00.000',50000,'DIKSI 2','2022-08-02T14:59:18.628892','2022-08-02T14:59:18.628892','2022-08-02T14:59:18.628892');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('transactions',4);
COMMIT;
