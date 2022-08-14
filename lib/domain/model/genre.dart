class Genre {
  String? sId;
  String? genreName;
  String? createdAt;
  String? updatedAt;
  int? genreID;

  Genre(
      {this.sId, this.genreName, this.createdAt, this.updatedAt, this.genreID});

  Genre.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    genreName = json['genreName'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    genreID = json['genreID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['genreName'] = genreName;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['genreID'] = genreID;
    return data;
  }
}