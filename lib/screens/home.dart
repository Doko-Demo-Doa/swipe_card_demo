import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:swiper_demo/api/api_person.dart';
import 'package:swiper_demo/models/person.dart';
import 'package:swiper_demo/widgets/home/swipe_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List<Person> people = [];

  @override
  void initState() {
    super.initState();
    this.initData();
  }

  void initData() async {
    var person1 = ApiPerson.getPerson();
    var person2 = ApiPerson.getPerson();
    var person3 = ApiPerson.getPerson();
    var fetchedPeople =
        await Future.wait([person1, person2, person3], eagerError: true);
    List<Person> newPeople = [];
    newPeople.addAll(fetchedPeople);
    this.setState(() {
      people.addAll(newPeople);
    });
  }

  onSwipe(bool isRight) async {
    List<Person> newPeople = people;
    newPeople.removeAt(0);
    var person = await ApiPerson.getPerson();
    // print(person.firstName);
    newPeople.add(person);
    // people.add(person);
    this.setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Swiper Demo'),
      ),
      body: people.length > 1
          ? Align(
              alignment: Alignment.center,
              child: new TinderSwapCard(
                orientation: AmassOrientation.TOP,
                stackNum: 3,
                maxWidth: MediaQuery.of(context).size.width * 0.9,
                maxHeight: MediaQuery.of(context).size.width * 0.9,
                minWidth: MediaQuery.of(context).size.width * 0.8,
                minHeight: MediaQuery.of(context).size.width * 0.8,
                cardBuilder: (BuildContext context, int index) {
                  var item = people.last;
                  return SwipeCard(person: item);
                },
                totalNum: 3000,
                swipeCompleteCallback:
                    (CardSwipeOrientation orientation, int index) {
                  // this.onSwipe(orientation == CardSwipeOrientation.RIGHT);
                },
              ),
            )
          : null,
    );
  }
}
