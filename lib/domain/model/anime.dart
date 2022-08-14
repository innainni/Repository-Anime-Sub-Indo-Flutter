import 'package:floor/floor.dart';

@entity
class Anime {
  String? source;
  List<String>? season;
  List<String>? listGenre;
  String? sId;
  String? title;
  String? externalId;
  String? icon;
  String? cover;
  String? type;
  String? status;
  String? score;
  String? released;
  String? studios;
  String? sinopsis;
  String? duration;
  String? createdAt;
  String? updatedAt;
  @primaryKey
  int? animeID;
  bool? isFavorite;
  int? timeToAddFavorite;

  Anime({
    this.source,
    this.season,
    this.listGenre,
    this.sId,
    this.title,
    this.externalId,
    this.icon,
    this.cover,
    this.type,
    this.status,
    this.score,
    this.released,
    this.studios,
    this.sinopsis,
    this.duration,
    this.createdAt,
    this.updatedAt,
    this.animeID,
    this.isFavorite,
    this.timeToAddFavorite,
  });

  Anime.fromJson(Map<String, dynamic> json) {
    source = json['source'];
    season = json['season'].cast<String>();
    listGenre = json['listGenre'].cast<String>();
    sId = json['_id'];
    title = json['title'];
    externalId = json['externalId'];
    icon = json['icon'];
    cover = json['cover'];
    type = json['type'];
    status = json['status'];
    score = json['score'];
    released = json['released'];
    studios = json['studios'];
    sinopsis = json['sinopsis'];
    duration = json['duration'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    animeID = json['animeID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['source'] = source;
    data['season'] = season;
    data['listGenre'] = listGenre;
    data['_id'] = sId;
    data['title'] = title;
    data['externalId'] = externalId;
    data['icon'] = icon;
    data['cover'] = cover;
    data['type'] = type;
    data['status'] = status;
    data['score'] = score;
    data['released'] = released;
    data['studios'] = studios;
    data['sinopsis'] = sinopsis;
    data['duration'] = duration;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['animeID'] = animeID;
    data['timeToAddFavorite'] = timeToAddFavorite;
    return data;
  }
}
