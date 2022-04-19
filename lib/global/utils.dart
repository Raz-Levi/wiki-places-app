// ================= Utils For Project =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/pages/webview/webview.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/metrics/google_analytics.dart';

// Navigation
void navigateToPage(Widget page) {
  Get.to(page);
}

void navigateBack() {
  Get.back();
  if (Get.context != null) {
    FocusScope.of(Get.context!).unfocus(); // Remove the keyboard
  }
}

void openWikipedia(String url) {
  navigateToPage(WebViewPage(url: url));
  GoogleAnalytics.instance.logReadMoreClicked();
}

// Messages
void displaySnackbar({String title = "", String content = ""}) {
  Get.snackbar(title, content,
      titleText: Text(title, style: Get.textTheme.headline5,),
      messageText: Text(content, style: Get.textTheme.headline5,),
      snackPosition: SnackPosition.BOTTOM,
      barBlur: 50, 
      snackStyle: SnackStyle.FLOATING, 
      margin: const EdgeInsets.all(5), 
      padding: const EdgeInsets.only(bottom: 30, left: 50, right: 50)
  );
}

void openModalBottomSheet({List<Widget>? children}) {
  if (children == null) {
    return;
  }

  Get.bottomSheet(
    SingleChildScrollView(
        child: /*Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
            ),
            child: SafeArea(
              child: Wrap(
                children: children,
              ),
            ),
          ),*/
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    ),
            )),
    isScrollControlled: true,
    backgroundColor: Get.theme.primaryColorLight,
    elevation: 10,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15))),

  );
}

// Converters
dynamic indexToEnum(List enumValues, int index) {
  try {
    return enumValues[index];
  } catch (e) {
    return null;
  }
}

// Extensions
extension St on String {
  int compareStrings(String other) {
    return toLowerCase().compareTo(other.toLowerCase());
  }
}

extension Ex on num {
  String toPrecisionString() =>
      double.parse(toStringAsFixed(GlobalConstants.defaultPrecision))
          .toString();
}
