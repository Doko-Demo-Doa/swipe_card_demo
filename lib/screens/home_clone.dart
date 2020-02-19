import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:swiper_demo/widgets/home/swipe_card_clone.dart';

class HomeClone extends StatelessWidget {
  onSwipe(bool isRight) async {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Swiper Demo'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: new TinderSwapCard(
          orientation: AmassOrientation.TOP,
          stackNum: 3,
          swipeEdge: 4.0,
          maxWidth: MediaQuery.of(context).size.width * 0.9,
          maxHeight: MediaQuery.of(context).size.width * 0.9,
          minWidth: MediaQuery.of(context).size.width * 0.8,
          minHeight: MediaQuery.of(context).size.width * 0.8,
          cardBuilder: (BuildContext context, int index) {
            return SwipeCardClone();
          },
          totalNum: 2000,
          swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
            if (orientation == CardSwipeOrientation.RECOVER)
              return this.onSwipe(orientation == CardSwipeOrientation.RIGHT);
          },
        ),
      ),
    );
  }
}
