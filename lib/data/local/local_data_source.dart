import 'package:repository_anime_sub_indo/data/local/dao/anime_dao.dart';
import 'package:repository_anime_sub_indo/data/local/dao/episode_dao.dart';
import 'package:repository_anime_sub_indo/data/local/entity/episode_entity.dart';
import 'package:repository_anime_sub_indo/domain/model/anime.dart';

class LocalDataSource {
  final AnimeDao _animeDao;
  final EpisodeDao _episodeDao;

  LocalDataSource(this._animeDao, this._episodeDao);

  Future<List<Anime>> getListAnimeFavorite() {
    return _animeDao.getListFavorite();
  }

  Stream<List<Anime>> streamAnimeFavorite() {
    return _animeDao.streamListFavorite();
  }

  Stream<Anime?> isFavoriteAnime(int animeId) {
    return _animeDao.isFavorite(animeId);
  }

  Future<void> insertAnime(Anime data) {
    return _animeDao.insertData(data);
  }

  Future<void> deleteAnime(Anime data) {
    return _animeDao.deleteData(data);
  }

  Future<void> addEpisode(EpisodeEntity data) {
    return _episodeDao.insertData(data);
  }

  Future<List<EpisodeEntity>> getEpisodeByIdAnime(String idAnime) {
    return _episodeDao.getByIdAnime(idAnime);
  }
}
