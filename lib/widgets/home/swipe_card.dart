import 'package:flutter/material.dart';
import 'package:swiper_demo/common/colors.dart';
import 'package:swiper_demo/models/person.dart';
import 'package:swiper_demo/widgets/home/indicator_icon.dart';

// class SwipeCard extends StatefulWidget {
//   final Person person;

//   SwipeCard({this.person, this.currentIndex});

//   @override
//   _SwipeCardState createState() {
//     return _SwipeCardState(this.person, this.currentIndex);
//   }
// }

class SwipeCard extends StatelessWidget {
  final person;
  final currentIndex;
  final loading;
  SwipeCard({this.person, this.currentIndex, this.loading});

  @override
  Widget build(BuildContext context) {
    final cardSize = 320.0;
    final imageSize = 138.0;

    return Container(
      width: cardSize,
      height: cardSize,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 2, color: Colors.black12)),
      child: this.loading
          ? Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 100, maxHeight: 100),
                child: CircularProgressIndicator(),
              ),
            )
          : Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Column(children: <Widget>[
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: CommonColors.PALE_GREY,
                        border: Border(
                            bottom: BorderSide(
                                width: 1, color: CommonColors.LIGHT_GREY))),
                  ),
                  Expanded(
                      flex: 2,
                      child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text('My address is ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      height: 2,
                                      fontSize: 18,
                                      color: CommonColors.GREY)),
                              Text(
                                  '${person.firstName} ${person.lastName}', // '${person.firstName} ${person.lastName}'
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: CommonColors.ALMOST_BLACK)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  IndicatorIcon(name: 'person'),
                                  IndicatorIcon(name: 'calendar'),
                                  IndicatorIcon(name: 'map'),
                                  IndicatorIcon(name: 'phone'),
                                  IndicatorIcon(name: 'lock')
                                ],
                              )
                            ],
                          )))
                ]),
                Positioned(
                    top: 22,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(70)),
                          border: Border.all(
                              width: 2, color: CommonColors.LIGHT_GREY)),
                      child: ClipOval(
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/blank.jpg',
                          image: person.avatar,
                          width: imageSize,
                          height: imageSize,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ))
              ],
            ),
    );
  }
}
