import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:swiper_demo/api/api.dart';
import 'package:swiper_demo/models/person.dart';

class ApiPerson {
  static Future<Person> getPerson() async {
    Response resp = await MainApiClient.getUrl('?randomapi');
    var data = jsonDecode(resp.data);
    return Person.fromJson(data['results'][0]['user']);
  }
}