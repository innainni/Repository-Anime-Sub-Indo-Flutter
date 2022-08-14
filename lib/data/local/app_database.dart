// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:repository_anime_sub_indo/data/local/dao/anime_dao.dart';
import 'package:repository_anime_sub_indo/data/local/dao/episode_dao.dart';
import 'package:repository_anime_sub_indo/data/local/entity/episode_entity.dart';
import 'package:repository_anime_sub_indo/domain/model/anime.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'coverter/list_string_converter.dart';

part 'app_database.g.dart'; // the generated code will be there

@TypeConverters([ListStringConverter])
@Database(version: 1, entities: [Anime, EpisodeEntity])
abstract class AppDatabase extends FloorDatabase {
  AnimeDao get animeDao;
  EpisodeDao get episodeDao;
}