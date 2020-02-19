import 'package:flutter/material.dart';
import 'package:swiper_demo/common/colors.dart';
import 'package:swiper_demo/models/person.dart';

class Faved extends StatelessWidget {
  final List<Person> list;
  Faved({this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Favorites'),
        ),
        body: Container(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              var item = this.list[index];
              return Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        blurRadius: 6.0,
                        spreadRadius: 1.0,
                        color: Colors.black12,
                        offset: Offset(0.1, 2))
                  ]),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(item.avatar)),
                      Padding(padding: const EdgeInsets.only(right: 22)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('${item.firstName} ${item.lastName}',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: CommonColors.METALLIC_BLUE)),
                          Text('${item.address}',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: CommonColors.FAWN))
                        ],
                      )
                    ],
                  ));
            },
          ),
        ));
  }
}
