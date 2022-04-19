// ================= Search Places FAB =================
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_places/controllers/store_controller.dart';
import 'package:wiki_places/global/constants.dart';
import 'package:wiki_places/global/utils.dart';

class SearchPlacesFAB extends StatelessWidget {
  SearchPlacesFAB({Key? key}) : super(key: key);
  final _storeController = Get.put(StoreController());

  void _searchPlaces() {
    _storeController.searchPlaces();
    displaySnackbar(
        content: 'strSearchSuccessfully'.trParams({
        'radius': _storeController.radius.value,
        'scale': GlobalConstants.defaultScale,
    }));
  }

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: FloatingActionButton.extended(
          label: Text('strSearchPlace'.tr, style: Get.textTheme.headline3,),
          icon: Icon(GlobalConstants.searchIcon, ),
          onPressed: _searchPlaces,
        ),
      );
  }
}
