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
    firstName = json['name']['first'],
    lastName = json['name']['last'],
    email = json['email'],
    birthday = json['dob'],
    address = json['location']['street'],
    avatar = json['picture']['large'];
}
