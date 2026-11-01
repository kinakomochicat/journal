import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> loadPosts() async {
  var url = Uri.parse('assets/assets/posts.json');
  var res = await http.get(url);
  if (res.statusCode != 200) {
    throw Exception(
      '小さな幸せ集を読み込めませんでした（HTTP ${res.statusCode}）',
    );
  }


  List posts = jsonDecode(utf8.decode(res.bodyBytes));
  return posts;
}