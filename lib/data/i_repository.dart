import 'package:repository_anime_sub_indo/domain/model/anime.dart';
import 'package:repository_anime_sub_indo/domain/model/config_app.dart';
import 'package:repository_anime_sub_indo/domain/model/episode.dart';
import 'package:repository_anime_sub_indo/domain/model/genre.dart';
import 'package:repository_anime_sub_indo/domain/model/player_video_data.dart';

abstract class IRepository {
  //configApp
  Future<ConfigApp> getConfigApp(String packagename);
  //Genre
  Future<List<Genre>> getAllGenre();
  //Episode
  Future<List<Episode>> getLatestEpisode(int page, int limit);
  Future<Episode> findEpisodeById(String episodeId);
  Future<List<Episode>> findEpisodeByIdAnime(
      String idAnime, int page, int limit);
  Future<void> addEpisodeToWatched(Episode episode);
  Future<void> countViewVideoEpisode(String idEpisode);
  //Anime
  Future<Anime> findAnimeById(String animeId);
  Future<List<Anime>> findAnimeByTitle(String title);
  Future<List<Anime>> animeByGenre(String genre);
  Stream<Anime?> isFavoriteAnime(int animeId);
  Future<void> addAnimeToFavorite(Anime anime);
  Future<void> removeAnimeFromFavorite(Anime anime);
  Future<List<Anime>> getListAnimeFavorite();
  Stream<List<Anime>> streamListAnimeFavorite();
  //player
  Future<List<PlayerVideoData>> getPlayerVideoData(
      String episodeExternalId, String type, String source);
  //fcm
  Future<void> addFcmToken(String token);
  bool isValidToWatch(int currentVersion);
}
