import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:swiper_demo/api/api_person.dart';
import 'package:swiper_demo/models/person.dart';
import 'package:swiper_demo/services/cache_service.dart';
import 'package:swiper_demo/widgets/home/swipe_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List<Person> people = [];
  bool loading = false;
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
    this.initData();
  }

  void initData() async {
    var person1 = ApiPerson.getPerson();
    var person2 = ApiPerson.getPerson();
    var person3 = ApiPerson.getPerson();
    this.setState(() {
      loading = true;
    });
    var fetchedPeople =
        await Future.wait([person1, person2, person3], eagerError: true);
    List<Person> newPeople = [];
    newPeople.addAll(fetchedPeople);
    this.setState(() {
      people.addAll(newPeople);
      loading = false;
    });
  }

  onSwipe(bool isRight) async {
    activeIndex++;
    List<Person> newPeople = [];
    newPeople.addAll(people);
    this.setState(() {
      loading = true;
    });

    if (isRight) {
      CacheService().addSinglePerson(people.first);
    }

    this.setState(() {
      people = newPeople;
    });
    var person = await ApiPerson.getPerson();
    this.setState(() {
      loading = false;
    });
    newPeople.add(person);
    newPeople.removeAt(0);
    this.setState(() {
      people = newPeople;
    });
  }

  onPress() async {
    var res = await CacheService().getAllPeople();
    if (res != null) {
      Navigator.pushNamed(context, 'Favorites', arguments: res);
    } else {
       Fluttertoast.showToast(
        msg: 'No favorite',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.pink,
        textColor: Colors.white,
        fontSize: 16.0);
    }
  }

  onDelete(BuildContext context) async {
    var res = await CacheService().clearAllPeople();

    Fluttertoast.showToast(
        msg: res ? 'Cleared favorite list' : 'An error occurred',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.pink,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Swiper Demo'), actions: <Widget>[
        IconButton(
          tooltip: 'View Favorites',
          icon: Icon(Icons.favorite),
          onPressed: this.onPress,
        ),
        IconButton(
          tooltip: 'Clear Favorites',
          icon: Icon(Icons.delete),
          onPressed: () {
            this.onDelete(context);
          },
        )
      ]),
      body: people.length > 1
          ? Align(
              alignment: Alignment.center,
              child: new TinderSwapCard(
                orientation: AmassOrientation.TOP,
                stackNum: 4,
                swipeEdge: 4.0,
                maxWidth: MediaQuery.of(context).size.width * 0.9,
                maxHeight: MediaQuery.of(context).size.width * 0.9,
                minWidth: MediaQuery.of(context).size.width * 0.8,
                minHeight: MediaQuery.of(context).size.width * 0.8,
                cardBuilder: (BuildContext context, int index) {
                  return SwipeCard(
                      person: people.first,
                      currentIndex: index,
                      loading: index > activeIndex || this.loading);
                },
                totalNum: 2000,
                swipeCompleteCallback:
                    (CardSwipeOrientation orientation, int index) {
                  if (orientation != CardSwipeOrientation.RECOVER) {
                    this.onSwipe(orientation == CardSwipeOrientation.RIGHT);
                  }
                },
              ),
            )
          : null,
    );
  }
}
