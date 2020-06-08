import 'package:flutter/material.dart';
import 'package:random_color_generator/utils/utils.dart';

/// A widget that displays a centered integer counter value, filled with a specified color.
class ColorDisplay extends StatelessWidget {
  /// Creates a counter display widget.
  const ColorDisplay({
    Key key,
    @required this.color,
    @required this.colorName,
    this.isPortrait = true,
  })  : assert(color != null),
        assert(colorName != null),
        super(key: key);

  /// The color with which to fill the counter container.
  final Color color;

  /// The value of the counter.
  final String colorName;

  /// Are we in portrait "mode"?
  final bool isPortrait;

  @override
  Widget build(BuildContext context) {
    final TextStyle counterStyle =
        isPortrait ? Theme.of(context).textTheme.headline1 : Theme.of(context).textTheme.headline2;

    return Container(
      alignment: Alignment.center,
      color: color,
      padding: const EdgeInsets.all(16.0),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          colorName,
          overflow: TextOverflow.ellipsis,
          style: counterStyle.copyWith(
            color: color.contrastOf(),
          ),
        ),
      ),
    );
  }
}
