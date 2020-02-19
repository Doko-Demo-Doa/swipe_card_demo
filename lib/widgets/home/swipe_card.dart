import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  final Person person;
  final currentIndex;
  final loading;
  final Function(int) onSelectIndex;
  SwipeCard({this.person, this.currentIndex, this.loading, this.onSelectIndex});

  String getSectionTitle() {
    if (currentIndex == 0) return 'Hi, My name is';
    if (currentIndex == 1) return 'My email address is';
    if (currentIndex == 2) return 'My birthday is';
    if (currentIndex == 3) return 'My address is';
    if (currentIndex == 4) return 'My phone number is';
    if (currentIndex == 5) return 'My password is';
    return '';
  }

  String getSectionValue() {
    if (currentIndex == 0) return '${person.firstName} ${person.lastName}';
    if (currentIndex == 1) return person.email;
    if (currentIndex == 2) return person.birthday;
    if (currentIndex == 3) return person.address;
    if (currentIndex == 4) return person.phone;
    if (currentIndex == 5) return person.password;
  }

  @override
  Widget build(BuildContext context) {
    final cardSize = 320.0;
    final imageSize = 138.0;

    return AnimatedContainer(
      duration: Duration(seconds: 1),
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
                              Text(getSectionTitle(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      height: 2,
                                      fontSize: 16,
                                      color: CommonColors.GREY)),
                              Text(
                                  getSectionValue(), // '${person.firstName} ${person.lastName}'
                                  style: GoogleFonts.lato(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: CommonColors.ALMOST_BLACK)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  IndicatorIcon(
                                      name: 'person',
                                      selfIndex: 0,
                                      selectedIndex: currentIndex,
                                      onPress: () {
                                        onSelectIndex(0);
                                      }),
                                  IndicatorIcon(
                                      name: 'calendar',
                                      selfIndex: 1,
                                      selectedIndex: currentIndex,
                                      onPress: () {
                                        onSelectIndex(1);
                                      }),
                                  IndicatorIcon(
                                      name: 'map',
                                      selfIndex: 2,
                                      selectedIndex: currentIndex,
                                      onPress: () {
                                        onSelectIndex(2);
                                      }),
                                  IndicatorIcon(
                                      name: 'phone',
                                      selfIndex: 3,
                                      selectedIndex: currentIndex,
                                      onPress: () {
                                        onSelectIndex(3);
                                      }),
                                  IndicatorIcon(
                                      name: 'lock',
                                      selfIndex: 4,
                                      selectedIndex: currentIndex,
                                      onPress: () {
                                        onSelectIndex(4);
                                      })
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
