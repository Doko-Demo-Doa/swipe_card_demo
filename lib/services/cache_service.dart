import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:swiper_demo/models/person.dart';

class CacheService {
  Future<bool> clearAllPeople() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<Person>> getAllPeople() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final resp = prefs.getStringList('PEOPLE');

    if (resp != null) {
      var result =
          resp.map((e) => Person.fromLocalObject(jsonDecode(e))).toList();
      return result;
    }

    return null;
  }

  void addSinglePerson(Person p) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var resp = prefs.getStringList('PEOPLE') ?? [];
    resp.add(jsonEncode(p.toJson()));
    prefs.setStringList('PEOPLE', resp);
  }

  void setAllPeople(List<Person> people) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('PEOPLE', people.map((e) => jsonEncode(e.toJson())));
  }
}
