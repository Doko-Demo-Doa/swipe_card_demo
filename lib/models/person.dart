import 'package:basic_utils/basic_utils.dart';

class Person {
  String gender;
  String title;
  String firstName;
  String lastName;
  String email;
  String birthday;
  String address;
  String avatar;

  Person.fromJson(Map<String, dynamic> json):
    gender = json['gender'],
    title = json['name']['title'],
    firstName = StringUtils.capitalize(json['name']['first']),
    lastName = StringUtils.capitalize(json['name']['last']),
    email = json['email'],
    birthday = json['dob'],
    address = json['location']['street'],
    avatar = json['picture']['large'];
}
