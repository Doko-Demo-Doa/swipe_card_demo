import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swiper_demo/common/colors.dart';
import 'package:swiper_demo/widgets/home/triangle.dart';

class IndicatorIcon extends StatelessWidget {
  final name;
  final int selfIndex;
  final int selectedIndex;
  final Function onPress;
  IndicatorIcon({this.name, this.onPress, this.selfIndex, this.selectedIndex});

  List getCombo() {
    switch (this.name) {
      case 'person':
        return [FontAwesomeIcons.userAlt, Colors.pink];
      case 'calendar':
        return [FontAwesomeIcons.calendar, CommonColors.LIGHT_BLUE];
      case 'map':
        return [FontAwesomeIcons.mapMarkedAlt, CommonColors.LIGHT_OLIVE_GREEN];
      case 'phone':
        return [FontAwesomeIcons.phoneAlt, CommonColors.SUNFLOWER];
      case 'lock':
        return [FontAwesomeIcons.lock, CommonColors.CORNFLOWER];
      default:
        return [FontAwesomeIcons.lock, CommonColors.LIGHT_GREY];
    }
  }

  @override
  Widget build(BuildContext context) {
    bool highlighted = selfIndex == selectedIndex;
    return GestureDetector(
      onTap: onPress,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
              top: 14,
              child: Container(
                width: 6,
                height: 6,
                child: CustomPaint(
                  painter: TrianglePainter(
                    strokeColor: highlighted ? getCombo()[1] : Colors.white,
                    strokeWidth: 5,
                    paintingStyle: PaintingStyle.fill,
                  ),
                ),
              )),
          Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.only(top: 12),
            alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(4, 20, 4, 0),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: 2,
                        color: selfIndex == selectedIndex
                            ? getCombo()[1]
                            : Colors.white))),
            child: Icon(
              getCombo()[0],
              color: selfIndex == selectedIndex ? getCombo()[1] : Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
