import 'package:repository_anime_sub_indo/domain/model/anime.dart';

class Episode {
  bool? isDirectPlay;
  int? countView;
  List<ListVideo>? listVideo;
  String? sId;
  String? title;
  String? icon;
  String? externalId;
  int? episodeID;
  // ignore: unnecessary_question_mark
  dynamic? episode;
  String? released;
  String? source;
  String? from;
  Anime? anime;
  String? createdAt;
  String? updatedAt;
  bool? isWatched;

  Episode(
      {this.isDirectPlay,
      this.countView,
      this.listVideo,
      this.sId,
      this.title,
      this.icon,
      this.externalId,
      this.episodeID,
      this.episode,
      this.released,
      this.source,
      this.from,
      this.anime,
      this.createdAt,
      this.updatedAt,
      this.isWatched});

  Episode.fromJson(Map<String, dynamic> json) {
    isDirectPlay = json['isDirectPlay'];
    countView = json['countView'];
    if (json['listVideo'] != null) {
      listVideo = <ListVideo>[];
      json['listVideo'].forEach((v) {
        listVideo!.add(ListVideo.fromJson(v));
      });
    }
    sId = json['_id'];
    title = json['title'];
    icon = json['icon'];
    externalId = json['externalId'];
    episodeID = json['episodeID'];
    episode = json['episode'];
    released = json['released'];
    source = json['source'];
    from = json['from'];
    anime = json['anime'] != null ? Anime.fromJson(json['anime']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isDirectPlay'] = isDirectPlay;
    data['countView'] = countView;
    if (listVideo != null) {
      data['listVideo'] = listVideo!.map((v) => v.toJson()).toList();
    }
    data['_id'] = sId;
    data['title'] = title;
    data['icon'] = icon;
    data['externalId'] = externalId;
    data['episodeID'] = episodeID;
    data['episode'] = episode;
    data['released'] = released;
    data['source'] = source;
    data['from'] = from;
    if (anime != null) {
      data['anime'] = anime!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class ListVideo {
  String? title;
  String? id;
  String? type;

  ListVideo({this.title, this.id, this.type});

  ListVideo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['id'] = id;
    data['type'] = type;
    return data;
  }
}
