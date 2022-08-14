// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  AnimeDao? _animeDaoInstance;

  EpisodeDao? _episodeDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
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
            'CREATE TABLE IF NOT EXISTS `Anime` (`source` TEXT, `season` TEXT, `listGenre` TEXT, `sId` TEXT, `title` TEXT, `externalId` TEXT, `icon` TEXT, `cover` TEXT, `type` TEXT, `status` TEXT, `score` TEXT, `released` TEXT, `studios` TEXT, `sinopsis` TEXT, `duration` TEXT, `createdAt` TEXT, `updatedAt` TEXT, `animeID` INTEGER, `isFavorite` INTEGER, `timeToAddFavorite` INTEGER, PRIMARY KEY (`animeID`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Episode` (`episodeID` INTEGER, `idAnime` TEXT, PRIMARY KEY (`episodeID`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  AnimeDao get animeDao {
    return _animeDaoInstance ??= _$AnimeDao(database, changeListener);
  }

  @override
  EpisodeDao get episodeDao {
    return _episodeDaoInstance ??= _$EpisodeDao(database, changeListener);
  }
}

class _$AnimeDao extends AnimeDao {
  _$AnimeDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _animeInsertionAdapter = InsertionAdapter(
            database,
            'Anime',
            (Anime item) => <String, Object?>{
                  'source': item.source,
                  'season': _listStringConverter.encode(item.season),
                  'listGenre': _listStringConverter.encode(item.listGenre),
                  'sId': item.sId,
                  'title': item.title,
                  'externalId': item.externalId,
                  'icon': item.icon,
                  'cover': item.cover,
                  'type': item.type,
                  'status': item.status,
                  'score': item.score,
                  'released': item.released,
                  'studios': item.studios,
                  'sinopsis': item.sinopsis,
                  'duration': item.duration,
                  'createdAt': item.createdAt,
                  'updatedAt': item.updatedAt,
                  'animeID': item.animeID,
                  'isFavorite': item.isFavorite == null
                      ? null
                      : (item.isFavorite! ? 1 : 0),
                  'timeToAddFavorite': item.timeToAddFavorite
                },
            changeListener),
        _animeDeletionAdapter = DeletionAdapter(
            database,
            'Anime',
            ['animeID'],
            (Anime item) => <String, Object?>{
                  'source': item.source,
                  'season': _listStringConverter.encode(item.season),
                  'listGenre': _listStringConverter.encode(item.listGenre),
                  'sId': item.sId,
                  'title': item.title,
                  'externalId': item.externalId,
                  'icon': item.icon,
                  'cover': item.cover,
                  'type': item.type,
                  'status': item.status,
                  'score': item.score,
                  'released': item.released,
                  'studios': item.studios,
                  'sinopsis': item.sinopsis,
                  'duration': item.duration,
                  'createdAt': item.createdAt,
                  'updatedAt': item.updatedAt,
                  'animeID': item.animeID,
                  'isFavorite': item.isFavorite == null
                      ? null
                      : (item.isFavorite! ? 1 : 0),
                  'timeToAddFavorite': item.timeToAddFavorite
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Anime> _animeInsertionAdapter;

  final DeletionAdapter<Anime> _animeDeletionAdapter;

  @override
  Future<List<Anime>> getListFavorite() async {
    return _queryAdapter.queryList(
        'SELECT * FROM Anime Where isFavorite=1 ORDER BY timeToAddFavorite DESC',
        mapper: (Map<String, Object?> row) => Anime(
            source: row['source'] as String?,
            season: _listStringConverter.decode(row['season'] as String?),
            listGenre: _listStringConverter.decode(row['listGenre'] as String?),
            sId: row['sId'] as String?,
            title: row['title'] as String?,
            externalId: row['externalId'] as String?,
            icon: row['icon'] as String?,
            cover: row['cover'] as String?,
            type: row['type'] as String?,
            status: row['status'] as String?,
            score: row['score'] as String?,
            released: row['released'] as String?,
            studios: row['studios'] as String?,
            sinopsis: row['sinopsis'] as String?,
            duration: row['duration'] as String?,
            createdAt: row['createdAt'] as String?,
            updatedAt: row['updatedAt'] as String?,
            animeID: row['animeID'] as int?,
            isFavorite: row['isFavorite'] == null
                ? null
                : (row['isFavorite'] as int) != 0,
            timeToAddFavorite: row['timeToAddFavorite'] as int?));
  }

  @override
  Stream<List<Anime>> streamListFavorite() {
    return _queryAdapter.queryListStream(
        'SELECT * FROM Anime Where isFavorite=1 ORDER BY timeToAddFavorite DESC',
        mapper: (Map<String, Object?> row) => Anime(
            source: row['source'] as String?,
            season: _listStringConverter.decode(row['season'] as String?),
            listGenre: _listStringConverter.decode(row['listGenre'] as String?),
            sId: row['sId'] as String?,
            title: row['title'] as String?,
            externalId: row['externalId'] as String?,
            icon: row['icon'] as String?,
            cover: row['cover'] as String?,
            type: row['type'] as String?,
            status: row['status'] as String?,
            score: row['score'] as String?,
            released: row['released'] as String?,
            studios: row['studios'] as String?,
            sinopsis: row['sinopsis'] as String?,
            duration: row['duration'] as String?,
            createdAt: row['createdAt'] as String?,
            updatedAt: row['updatedAt'] as String?,
            animeID: row['animeID'] as int?,
            isFavorite: row['isFavorite'] == null
                ? null
                : (row['isFavorite'] as int) != 0,
            timeToAddFavorite: row['timeToAddFavorite'] as int?),
        queryableName: 'Anime',
        isView: false);
  }

  @override
  Stream<Anime?> isFavorite(int animeId) {
    return _queryAdapter.queryStream(
        'SELECT * FROM Anime WHERE animeId = ?1 AND isFavorite=1',
        mapper: (Map<String, Object?> row) => Anime(
            source: row['source'] as String?,
            season: _listStringConverter.decode(row['season'] as String?),
            listGenre: _listStringConverter.decode(row['listGenre'] as String?),
            sId: row['sId'] as String?,
            title: row['title'] as String?,
            externalId: row['externalId'] as String?,
            icon: row['icon'] as String?,
            cover: row['cover'] as String?,
            type: row['type'] as String?,
            status: row['status'] as String?,
            score: row['score'] as String?,
            released: row['released'] as String?,
            studios: row['studios'] as String?,
            sinopsis: row['sinopsis'] as String?,
            duration: row['duration'] as String?,
            createdAt: row['createdAt'] as String?,
            updatedAt: row['updatedAt'] as String?,
            animeID: row['animeID'] as int?,
            isFavorite: row['isFavorite'] == null
                ? null
                : (row['isFavorite'] as int) != 0,
            timeToAddFavorite: row['timeToAddFavorite'] as int?),
        arguments: [animeId],
        queryableName: 'Anime',
        isView: false);
  }

  @override
  Future<void> insertData(Anime data) async {
    await _animeInsertionAdapter.insert(data, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteData(Anime data) async {
    await _animeDeletionAdapter.delete(data);
  }
}

class _$EpisodeDao extends EpisodeDao {
  _$EpisodeDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _episodeEntityInsertionAdapter = InsertionAdapter(
            database,
            'Episode',
            (EpisodeEntity item) => <String, Object?>{
                  'episodeID': item.episodeID,
                  'idAnime': item.idAnime
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<EpisodeEntity> _episodeEntityInsertionAdapter;

  @override
  Future<List<EpisodeEntity>> getByIdAnime(String idAnime) async {
    return _queryAdapter.queryList('SELECT * FROM Episode Where idAnime=?1',
        mapper: (Map<String, Object?> row) =>
            EpisodeEntity(row['episodeID'] as int?, row['idAnime'] as String?),
        arguments: [idAnime]);
  }

  @override
  Future<void> insertData(EpisodeEntity data) async {
    await _episodeEntityInsertionAdapter.insert(
        data, OnConflictStrategy.replace);
  }
}

// ignore_for_file: unused_element
final _listStringConverter = ListStringConverter();
