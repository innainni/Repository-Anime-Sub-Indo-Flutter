import 'package:repository_anime_sub_indo/config.dart';
import 'package:repository_anime_sub_indo/domain/model/anime.dart';
import 'package:repository_anime_sub_indo/domain/model/config_app.dart';
import 'package:repository_anime_sub_indo/domain/model/episode.dart';
import 'package:repository_anime_sub_indo/domain/model/genre.dart';
import 'package:dio/dio.dart';
import 'package:repository_anime_sub_indo/domain/model/player_video_data.dart';

class RemoteDataSource {
  final _dio = Dio();

  Future<List<Genre>> getAllGenre() async {
    var response = await _dio.get("$baseUrlAnimeSubIndo/genre/all");
    return (response.data as List)
        .map((value) => Genre.fromJson(value))
        .toList();
  }

  Future<ConfigApp> getConfigApp(String packagename) async {
    var response = await _dio
        .get("$baseUrlAnimeSubIndo/infoApp/?packageName=$packagename");
    return ConfigApp.fromJson(response.data);
  }

  Future<List<Episode>> getLatestEpisode(int page, int limit) async {
    var response = await _dio.get(
        "$baseUrlAnimeSubIndo/episode/latestPaginate?page=$page&limit=$limit");
    return (response.data as List)
        .map((value) => Episode.fromJson(value))
        .toList();
  }

  Future<Episode> findOneEpisode(dynamic data) async {
    var response =
        await _dio.post("$baseUrlAnimeSubIndo/episode/findOne", data: data);
    return Episode.fromJson(response.data);
  }

  Future<List<Episode>> findEpisode(dynamic data) async {
    var response =
        await _dio.post("$baseUrlAnimeSubIndo/episode/find", data: data);
    return (response.data as List)
        .map((value) => Episode.fromJson(value))
        .toList();
  }

  Future<Anime> findOneAnime(dynamic data) async {
    var response =
        await _dio.post("$baseUrlAnimeSubIndo/anime/findOne", data: data);
    return Anime.fromJson(response.data);
  }

  Future<List<Anime>> findAnimeLike({String? key, String? value}) async {
    var response = await _dio
        .get("$baseUrlAnimeSubIndo/anime/findLike?key=$key&value=$value");
    return (response.data as List)
        .map((value) => Anime.fromJson(value))
        .toList();
  }

  Future<List<Anime>> getByGenre({required String genre}) async {
    var response =
        await _dio.get("$baseUrlAnimeSubIndo/anime/getByGenre?genre=$genre");
    return (response.data as List)
        .map((value) => Anime.fromJson(value))
        .toList();
  }

  Future<List<PlayerVideoData>> getPlayerVideoData(
      String episodeExternalId, String type, String source) async {
    var response = await _dio.post(
        "$baseUrlAnimeSubIndo/scrappers/getPlayerV2?source=$source",
        data: {
          {"id": episodeExternalId, "type": type}
        });

    return (response.data as List)
        .map((value) => PlayerVideoData.fromJson(value))
        .toList();
  }

  Future<void> countViewVideoEpisode(String idEpisode) async {
    var response = await _dio.get(
      "$baseUrlAnimeSubIndo/episode/counterView?_id=$idEpisode",
    );
    return response.data;
  }

  Future<void> addFcmToken(String token) async {
    var response = await _dio.post(
        "$baseUrlAnimeSubIndo/firebaseToken/createOrReplace",
        data: {"registrationToken": token});
    return response.data;
  }
}
