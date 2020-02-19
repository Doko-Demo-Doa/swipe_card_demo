import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swiper_demo/common/colors.dart';

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
    return GestureDetector(
      onTap: onPress,
      child: Stack(
        children: <Widget>[
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
