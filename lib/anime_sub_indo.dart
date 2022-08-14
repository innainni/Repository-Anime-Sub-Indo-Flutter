library anime_sub_indo;

import 'package:repository_anime_sub_indo/data/i_repository.dart';
import 'package:repository_anime_sub_indo/data/local/entity/episode_entity.dart';
import 'package:repository_anime_sub_indo/data/local/local_data_source.dart';
import 'package:repository_anime_sub_indo/data/remote/remote_data_source.dart';
import 'package:repository_anime_sub_indo/domain/model/anime.dart';
import 'package:repository_anime_sub_indo/domain/model/config_app.dart';
import 'package:repository_anime_sub_indo/domain/model/episode.dart';
import 'package:repository_anime_sub_indo/domain/model/genre.dart';
import 'package:repository_anime_sub_indo/domain/model/player_video_data.dart';

class AnimeSubIndo implements IRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  AnimeSubIndo(this.remoteDataSource, this.localDataSource);

  ConfigApp _configApp = ConfigApp();
  @override
  Future<ConfigApp> getConfigApp(String packagename) async {
    if (_configApp.sId == null) {
      _configApp = await remoteDataSource.getConfigApp(packagename);
    }
    return _configApp;
  }

  @override
  Future<List<Genre>> getAllGenre() {
    return remoteDataSource.getAllGenre();
  }

  @override
  Future<List<Episode>> getLatestEpisode(int page, int limit) {
    return remoteDataSource.getLatestEpisode(page, limit);
  }

  @override
  Future<List<Episode>> findEpisodeByIdAnime(
      String idAnime, int page, int limit) async {
    var listEpisodeRemote =
        await remoteDataSource.findEpisode({"anime": idAnime});
    var listEpisodeWatched = await localDataSource.getEpisodeByIdAnime(idAnime);
    return listEpisodeRemote.map((episodeRemote) {
      if (listEpisodeWatched.any((episodeWatched) =>
          episodeWatched.episodeID == episodeRemote.episodeID)) {
        episodeRemote.isWatched = true;
      }
      return episodeRemote;
    }).toList();
  }

  @override
  Future<Episode> findEpisodeById(String episodeId) {
    return remoteDataSource.findOneEpisode({"_id": episodeId});
  }

  @override
  Future<List<Anime>> findAnimeByTitle(keyword) {
    return remoteDataSource.findAnimeLike(key: "title", value: keyword);
  }

  @override
  Future<Anime> findAnimeById(String animeId) {
    return remoteDataSource.findOneAnime({"_id": animeId});
  }

  @override
  Future<void> addAnimeToFavorite(Anime anime) {
    anime.isFavorite = true;
    anime.timeToAddFavorite = DateTime.now().millisecondsSinceEpoch;
    return localDataSource.insertAnime(anime);
  }

  @override
  Future<List<Anime>> getListAnimeFavorite() {
    return localDataSource.getListAnimeFavorite();
  }

  @override
  Future<void> removeAnimeFromFavorite(Anime anime) {
    return localDataSource.deleteAnime(anime);
  }

  @override
  Stream<Anime?> isFavoriteAnime(int animeId) {
    return localDataSource.isFavoriteAnime(animeId);
  }

  @override
  Future<void> addEpisodeToWatched(Episode episode) {
    return localDataSource.addEpisode(EpisodeEntity.fromDomain(episode));
  }

  @override
  Future<void> countViewVideoEpisode(String idEpisode) {
    return remoteDataSource.countViewVideoEpisode(idEpisode);
  }

  @override
  Stream<List<Anime>> streamListAnimeFavorite() {
    return localDataSource.streamAnimeFavorite();
  }

  @override
  Future<void> addFcmToken(String token) {
    return remoteDataSource.addFcmToken(token);
  }

  @override
  bool isValidToWatch(double currentVersion) {
    var submitVersion = _configApp.submitVersion!.toDouble();
    var isValid = currentVersion < submitVersion;
    return _configApp.isCanWatch == true && isValid ||
        _configApp.newVersionHasRelease == true;
  }

  @override
  Future<List<Anime>> animeByGenre(String genre) {
    return remoteDataSource.getByGenre(genre: genre);
  }

  @override
  Future<List<PlayerVideoData>> getPlayerVideoData(
      String episodeExternalId, String type, String source) {
    return remoteDataSource.getPlayerVideoData(episodeExternalId, type, source);
  }
}
