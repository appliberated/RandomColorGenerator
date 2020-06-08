import 'package:random_color_generator/models/random_color.dart';
import 'package:random_color_generator/screens/home.dart';
import 'package:random_color_generator/widgets/app_drawer.dart';

/// Application wide UI and URL string constants.
class AppStrings {
  static const String appName = 'Random Color Generator';

  //#region Drawer

  static const String drawerTitle = appName;

  static const Map<DrawerExtraActions, String> drawerExtraTitles = {
    DrawerExtraActions.settings: 'Settings',
    DrawerExtraActions.help: 'Help & feedback',
    DrawerExtraActions.rate: 'Rate app',
  };

  static const String rateAppURL =
      'https://play.google.com/store/apps/details?id=com.appliberated.randomcolortherapy';

  static const String helpURL = 'https://appliberated.com/randomcolorgenerator/';

  //#endregion

  //#region Menu items and functionality

  static const Map<MenuAction, String> menuActions = {
    MenuAction.reset: 'Reset counter',
    MenuAction.share: 'Share...',
  };

  //#endregion

  //#region Model

  static const Map<ColorType, String> colorTypeTitles = {
    ColorType.basic: 'Random Basic Color Term',
    ColorType.css: 'Random CSS Color',
    ColorType.material: 'Random Material Color',
  };

  static const Map<ColorType, String> colorTypeListNames = {
    ColorType.basic: 'Basic Color Terms',
    ColorType.css: 'CSS Colors',
    ColorType.material: 'Material Colors',
  };

//#endregion

}
