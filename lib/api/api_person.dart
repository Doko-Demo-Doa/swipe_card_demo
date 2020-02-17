import 'package:dio/dio.dart';
import 'package:swiper_demo/api/api.dart';
import 'package:swiper_demo/models/person.dart';

class ApiProduct {
  static Future<Person> getPerson() async {
    Response resp = await MainApiClient.getUrl('?randomapi');
  }
}