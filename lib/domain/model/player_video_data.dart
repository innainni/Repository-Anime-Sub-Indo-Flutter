class PlayerVideoData {
  String? file;
  String? type;
  String? label;

  PlayerVideoData({this.file, this.type, this.label});

  PlayerVideoData.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    type = json['type'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['file'] = file;
    data['type'] = type;
    data['label'] = label;
    return data;
  }
}
