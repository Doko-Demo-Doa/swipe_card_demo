import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:swiper_demo/models/person.dart';

class CacheService {
  Future<List<Person>> getAllPeople() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final resp = prefs.getStringList('PEOPLE');
    var result = resp.map((e) => Person.fromJson(jsonDecode(e))).toList();
    return result;
  }
}
