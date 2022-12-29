import 'package:client/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const List<Widget> projectIcons = <Widget>[
  FaIcon(
    FontAwesomeIcons.userLarge,
    size: 20.0,
  ),
  FaIcon(
    FontAwesomeIcons.suitcase,
    size: 20.0,
  ),
  FaIcon(
    FontAwesomeIcons.dollarSign,
    size: 20.0,
  ),
  FaIcon(
    FontAwesomeIcons.film,
    size: 20.0,
  ),
  FaIcon(
    FontAwesomeIcons.calendar,
    size: 20.0,
  ),
];

List<Widget> projectColors = <Widget>[
  Container(
    decoration: const BoxDecoration(
      color: kRedColor,
    ),
  ),
  Container(
    color: kOrangeColor,
  ),
  Container(
    color: kBlueColor,
  ),
  Container(
    color: kGreenColor,
  ),
];
