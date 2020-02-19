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

  Person.fromJson(Map<String, dynamic> json)
      : gender = json['gender'],
        title = json['name']['title'],
        firstName = StringUtils.capitalize(json['name']['first']),
        lastName = StringUtils.capitalize(json['name']['last']),
        email = json['email'],
        birthday = json['dob'],
        address = json['location']['street'],
        avatar = json['picture']['large'];

  Person.fromLocalObject(Map<String, dynamic> localObj)
      : gender = localObj['gender'],
        title = localObj['title'],
        firstName = localObj['firstName'],
        lastName = localObj['lastName'],
        email = localObj['email'],
        birthday = localObj['birthday'],
        address = localObj['address'],
        avatar = localObj['avatar'];

  Map<String, dynamic> toJson() => {
    'gender': gender,
    'title': title,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'birthday': birthday,
    'address': address,
    'avatar': avatar
  };
}
