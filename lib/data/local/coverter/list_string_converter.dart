// ignore: file_names
import 'dart:convert';

import 'package:floor/floor.dart';

class ListStringConverter extends TypeConverter<List<String>?, String?> {
  @override
  List<String>? decode(String? databaseValue) {
    return databaseValue != null
        ? (jsonDecode(databaseValue) as List<dynamic>).cast<String>()
        : [""];
  }

  @override
  String? encode(List<String>? value) {
    return jsonEncode(value ?? [""]);
  }
}