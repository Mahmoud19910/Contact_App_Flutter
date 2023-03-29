// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data_base.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDataBase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDataBaseBuilder databaseBuilder(String name) =>
      _$AppDataBaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDataBaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDataBaseBuilder(null);
}

class _$AppDataBaseBuilder {
  _$AppDataBaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDataBaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDataBaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDataBase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDataBase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDataBase extends AppDataBase {
  _$AppDataBase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UsersInfo_Dao? _usersInfo_DaoInstance;

  Contacts_Dao? _contact_DaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 3,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `UsersInfo` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `pass` TEXT NOT NULL, `email` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Contacts` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `phone` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UsersInfo_Dao get usersInfo_Dao {
    return _usersInfo_DaoInstance ??= _$UsersInfo_Dao(database, changeListener);
  }

  @override
  Contacts_Dao get contact_Dao {
    return _contact_DaoInstance ??= _$Contacts_Dao(database, changeListener);
  }
}

class _$UsersInfo_Dao extends UsersInfo_Dao {
  _$UsersInfo_Dao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _usersInfoInsertionAdapter = InsertionAdapter(
            database,
            'UsersInfo',
            (UsersInfo item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'pass': item.pass,
                  'email': item.email
                },
            changeListener),
        _usersInfoDeletionAdapter = DeletionAdapter(
            database,
            'UsersInfo',
            ['id'],
            (UsersInfo item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'pass': item.pass,
                  'email': item.email
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UsersInfo> _usersInfoInsertionAdapter;

  final DeletionAdapter<UsersInfo> _usersInfoDeletionAdapter;

  @override
  Stream<List<UsersInfo>> getAllUsers() {
    return _queryAdapter.queryListStream('SELECT * FROM UsersInfo',
        mapper: (Map<String, Object?> row) => UsersInfo(row['name'] as String,
            row['pass'] as String, row['email'] as String),
        queryableName: 'UsersInfo',
        isView: false);
  }

  @override
  Future<UsersInfo?> getUserById(int id) async {
    return _queryAdapter.query('SELECT * FROM UsersInfo WHERE id = ?1',
        mapper: (Map<String, Object?> row) => UsersInfo(row['name'] as String,
            row['pass'] as String, row['email'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insertUser(UsersInfo user) async {
    await _usersInfoInsertionAdapter.insert(user, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteUser(UsersInfo user) async {
    await _usersInfoDeletionAdapter.delete(user);
  }
}

class _$Contacts_Dao extends Contacts_Dao {
  _$Contacts_Dao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _contactsInsertionAdapter = InsertionAdapter(
            database,
            'Contacts',
            (Contacts item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'phone': item.phone
                },
            changeListener),
        _contactsDeletionAdapter = DeletionAdapter(
            database,
            'Contacts',
            ['id'],
            (Contacts item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'phone': item.phone
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Contacts> _contactsInsertionAdapter;

  final DeletionAdapter<Contacts> _contactsDeletionAdapter;

  @override
  Stream<List<Contacts>> getAllContact() {
    return _queryAdapter.queryListStream('SELECT * FROM Contacts',
        mapper: (Map<String, Object?> row) => Contacts(
            row['name'] as String, row['phone'] as String, row['id'] as int?),
        queryableName: 'Contacts',
        isView: false);
  }

  @override
  Future<Contacts?> getContactById(int id) async {
    return _queryAdapter.query('SELECT * FROM Contacts WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Contacts(
            row['name'] as String, row['phone'] as String, row['id'] as int?),
        arguments: [id]);
  }

  @override
  Future<void> eleteContactById(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM Contacts WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> insertContact(Contacts user) async {
    await _contactsInsertionAdapter.insert(user, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteContact(Contacts user) async {
    await _contactsDeletionAdapter.delete(user);
  }
}
