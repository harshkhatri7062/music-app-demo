import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

openWebBrower(url) {
  FlutterWebBrowser.openWebPage(
      url: url,
      androidToolbarColor: Colors.blue,
      safariVCOptions: SafariViewControllerOptions(
        barCollapsingEnabled: true,
        dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        modalPresentationCapturesStatusBarAppearance: true,
      ));
}
