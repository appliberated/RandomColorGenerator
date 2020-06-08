import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:random_color_generator/common/app_strings.dart';
import 'package:random_color_generator/models/random_color.dart';

/// Drawer extra actions enumeration.
enum DrawerExtraActions { settings, help, rate }

class AppDrawer extends StatelessWidget {
  /// Creates an app drawer widget.
  const AppDrawer({
    Key key,
    @required this.title,
    @required this.selectedType,
    this.onSelected,
    this.onExtraSelected,
  })  : assert(title != null),
        super(key: key);

  /// The title of the drawer displayed in the drawer header.
  final String title;

  /// The current random color type.
  final ColorType selectedType;

  /// Called when the user taps a drawer list tile.
  final void Function(ColorType type) onSelected;

  /// Called when the user taps a drawer list tile.
  final void Function(DrawerExtraActions value) onExtraSelected;

  void _onExtraActionTap(BuildContext context, DrawerExtraActions action) {
    Navigator.pop(context);
    if (onExtraSelected != null) onExtraSelected(action);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListTileTheme(
        selectedColor: Colors.black,
        child: ListView(
          children: <Widget>[
            _buildDrawerHeader(context),
            ...ColorType.values.map((type) => _buildMainTile(context, type)),
            Divider(),
            _buildExtraTile(context, DrawerExtraActions.settings),
            _buildExtraTile(context, DrawerExtraActions.help),
            _buildExtraTile(context, DrawerExtraActions.rate),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerHeader(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight + 8.0,
      child: DrawerHeader(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  Widget _buildMainTile(BuildContext context, ColorType type) {
    return ListTile(
      title: Text(RandomColor.nameOf(type)),
      selected: selectedType == type,
      onTap: () {
        Navigator.pop(context);
        onSelected?.call(type);
      },
    );
//    return ColorListTile(
//      color: Weekdays.colorOf(day),
//      title: Weekdays.nameOf(day),
//      selected: selectedType == type,
//      onTap: () => onSelected?.call(type),
//    );
  }

  Widget _buildExtraTile(BuildContext context, DrawerExtraActions action) {
    const Map<DrawerExtraActions, IconData> drawerExtraIcons = {
      DrawerExtraActions.settings: Icons.settings,
      DrawerExtraActions.help: Icons.help_outline,
      DrawerExtraActions.rate: Icons.rate_review,
    };

    return ListTile(
      leading: Icon(drawerExtraIcons[action]),
      title: Text(AppStrings.drawerExtraTitles[action]),
      onTap: () {
        Navigator.pop(context);
        _onExtraActionTap(context, action);
      },
    );
  }
}
