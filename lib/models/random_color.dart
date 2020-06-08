import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_color_generator/common/app_strings.dart';
import 'package:random_color_generator/models/basic_colors.dart';
import 'package:random_color_generator/models/css_colors.dart';

enum ColorType { basic, css, material }

class NamedColor {
  final String name;
  final Color color;

  const NamedColor(this.name, this.color);
}

abstract class RandomColor {
  final Random random;

  RandomColor(this.random);

  ColorType get colorType;

//  Color get defaultColor;

  String get title => AppStrings.colorTypeTitles[colorType];

  void randomize();

  Color get color;

  String get colorName;

//  /// Returns the name of the specified counter type (e.g. "Black Counter").
//  static String nameOf(ColorType type) => AppStrings.colorTypeListNames[type];

  static String listNameOf(ColorType type) => AppStrings.colorTypeListNames[type];

  String get listName => AppStrings.colorTypeListNames[colorType];
}

abstract class RandomListColor extends RandomColor {
  RandomListColor(Random random) : super(random) {
    _randomNamedColor = colorList[0];
  }

  List<NamedColor> get colorList;

  NamedColor _randomNamedColor;

  @override
  Color get color => _randomNamedColor.color;

  String get colorName => _randomNamedColor.name;

  @override
  void randomize() {
    _randomNamedColor = colorList[random.nextInt(colorList.length)];
  }
}

class RandomBasicColor extends RandomListColor {
  RandomBasicColor(Random random) : super(random);

  @override
  ColorType get colorType => ColorType.basic;

  @override
  List<NamedColor> get colorList => basicColors;
}

class RandomCSSColor extends RandomListColor {
  RandomCSSColor(Random random) : super(random);

  @override
  ColorType get colorType => ColorType.css;

  @override
  List<NamedColor> get colorList => cssColors;
}

//class MaterialColorGenerator extends RandomColor {
//  MaterialColorGenerator(Random random) : super(random);
//
//  @override
//  ColorType get colorType => ColorType.material;
//
//  @override
//  // TODO: implement defaultColor
////  Color get defaultColor => throw UnimplementedError();
//  Color get defaultColor => throw UnimplementedError();
//
//  @override
//  // TODO: implement color
////  Color get color => throw UnimplementedError();
//  Color get color => Colors.red;
//
//  @override
//  void randomize() {
//    // TODO: implement randomize
//  }
//}
