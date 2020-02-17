import 'package:flutter/material.dart';
import 'package:swiper_demo/common/colors.dart';

class SwipeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cardSize = 300.0;
    final imageSize = 120.0;

    return Container(
      width: cardSize,
      height: cardSize,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 2, color: Colors.black12)),
      child: Stack(
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
                        Text('My address is',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              height: 3,
                                fontSize: 18, color: CommonColors.GREY)),
                        Text('4661 Auburn Ave',
                            style: TextStyle(
                                fontSize: 24, color: CommonColors.ALMOST_BLACK))
                      ],
                    )))
          ]),
          Positioned(
              top: 22,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(70)),
                    border:
                        Border.all(width: 2, color: CommonColors.LIGHT_GREY)),
                child: ClipOval(
                  child: Image.network(
                    'http://api.randomuser.me/portraits/women/28.jpg',
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
