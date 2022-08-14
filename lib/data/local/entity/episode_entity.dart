import 'package:floor/floor.dart';
import 'package:repository_anime_sub_indo/domain/model/episode.dart';

@Entity(tableName: "Episode")
class EpisodeEntity {
  @primaryKey
  int? episodeID;
  String? idAnime;

  EpisodeEntity(this.episodeID, this.idAnime);

  EpisodeEntity.fromDomain(Episode episode) {
    episodeID = episode.episodeID;
    idAnime = episode.anime?.sId;
  }
}
