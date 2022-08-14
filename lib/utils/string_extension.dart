import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

extension StringExtension on String {
  String toTimeAgo() =>
      timeago.format(DateTime.fromMillisecondsSinceEpoch(int.parse(this)));

  String toDate() =>
      DateTime.fromMillisecondsSinceEpoch(int.parse(this)).toString();

  String toDateYMD() {
    final date = DateTime.fromMillisecondsSinceEpoch(int.parse(this));
    return DateFormat('dd MMM yyyy').format(date);
  }

  String toEmbedHtml() {
    var baseHtml = '''
    <html xmlns='https://www.w3.org/1999/xhtml' lang='id-ID'>
    <head profile='http://gmpg.org/xfn/11'>
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
    <meta name='referrer' content='no-referrer' />
    <meta name='mobile-web-app-capable' content='yes'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <meta name='robots' content='noodp'></head>
    <body style='background-color: black;'>
      $this
    </body>
    </html>
      ''';
    return base64Encode(const Utf8Encoder().convert(baseHtml));
  }
}
