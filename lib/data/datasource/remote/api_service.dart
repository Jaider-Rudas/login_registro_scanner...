import 'dart:convert';


// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;



  @override
  Future delete<T>(String url, {Map<String, String>? header}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future getById<T>(String url, String id, {Map<String, String>? header}) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future post<T>(String url, Map<String, dynamic> body, {Map<String, String>? header}) async {
    Uri uri = Uri.parse(url);
    header ??= {"Content-Type": "application/json"};
    final response = await http.post(
      uri,
      headers: header,
      body: json.encode(body),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
    }
  }

  @override
  Future put<T>(String url, Map<String, dynamic> body, {Map<String, String>? header}) {
    // TODO: implement put
    throw UnimplementedError();
  }

