import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

IconData getIcon(String icon) {
  switch (icon) {
    case 'person':
      return FontAwesomeIcons.userLarge;
    case 'suitcase':
      return FontAwesomeIcons.suitcase;
    case 'dollarsign':
      return FontAwesomeIcons.dollarSign;
    case 'movies':
      return FontAwesomeIcons.film;
    case 'calender':
      return FontAwesomeIcons.calendar;
    default:
      return FontAwesomeIcons.userLarge;
  }
}
