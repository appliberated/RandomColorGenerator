import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:random_color_generator/models/random_color.dart';
import 'package:random_color_generator/utils/utils.dart';

class ColorListScreen extends StatelessWidget {
  const ColorListScreen({
    Key key,
    @required this.title,
    @required this.colorList,
  })  : assert(colorList != null),
        super(key: key);

  final String title;

  final List<NamedColor> colorList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: colorList.length,
        itemBuilder: (BuildContext context, int index) =>
            _buildColorListTile(context, colorList[index]),
      ),
    );
  }

//  Widget _buildColorListTile(BuildContext context, NamedColor namedColor) {
//    return Card(
//      child: Row(
//        children: [
//          Expanded(
//            child: Container(
//              color: namedColor.color,
//              height: 75,
//            ),
//          ),
//          Expanded(
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.center,
//              children: [
//                Text(
//                  namedColor.name,
//                  style: Theme.of(context).textTheme.headline6,
//                ),
//                Text(
//                  namedColor.color.toHexTriplet(),
//                ),
//              ],
//            ),
//          ),
//        ],
//      ),
//    );
//  }

//  Widget _buildColorListTile(BuildContext context, NamedColor namedColor) {
//    return Card(
//      color: namedColor.color,
//      child: Container(
//        padding: EdgeInsets.all(10),
//        child: ListTile(
//          title: Text(
//            namedColor.name,
//            style: Theme.of(context)
//                .textTheme
//                .subtitle1
//                .copyWith(color: namedColor.color.contrastOf()),
//          ),
//          subtitle: Text(namedColor.color.toHexTriplet()),
//        ),
//      ),
//    );
//  }

  Widget _buildColorListTile(BuildContext context, NamedColor namedColor) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: namedColor.color,
            height: 200,
          ),
          ListTile(
            title: Text(namedColor.name),
            subtitle: Text(namedColor.color.toHexTriplet()),
          ),
//          Padding(
//            padding: EdgeInsets.all(10),
//            child: Text(
//              namedColor.name,
//              style: Theme.of(context).textTheme.headline6,
//            ),
//          ),
//          Padding(
//            padding: EdgeInsets.all(10),
//            child: Text(
//              namedColor.color.toHexTriplet(),
//            ),
//          ),
        ],
      ),
    );
  }
}
