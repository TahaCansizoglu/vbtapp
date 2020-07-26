import 'dart:convert';

import 'package:deneme/model/Questions.dart';
import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;
import 'dart:async';

String url = 'http://10.0.2.2:8081/questions/';
Future<List<Questions>> getPost() async {
  List<Questions> _questions = [];
  var response = await http.get(url);
  final bodyResponse = jsonDecode(response.body);
  if (bodyResponse is List) {
    _questions = bodyResponse.map((e) => Questions.fromJson(e)).toList();
  }
  return _questions;
  //return Questions.fromJson();
}
