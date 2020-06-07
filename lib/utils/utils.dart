import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Shows a [SnackBar] with the specified [text] at the bottom of the specified scaffold.
void showSnackBar(ScaffoldState scaffoldState, String text) {
  scaffoldState.showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

/// Launches the specified [URL] in the mobile platform.
///
/// Shows an error [SnackBar] if there is no support for launching the URL.
Future<void> launchUrl(ScaffoldState scaffoldState, String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    showSnackBar(scaffoldState, 'Failed to open $url');
  }
}
