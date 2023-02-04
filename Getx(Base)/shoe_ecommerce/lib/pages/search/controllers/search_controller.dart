import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../network/models/shoe.dart';
import '../../home/data/shoes.dart';

class SearchController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController searchController = TextEditingController(text: '');
  RxString search = ''.obs;
  RxList<Shoe> searchedShoes = <Shoe>[].obs;

  //onSearch: TimKiem
  void onSearch() async {
    isLoading.value = true;
    searchedShoes.clear();
    await Future.delayed(
      const Duration(seconds: 2),
    );

    search.value = searchController.text;
    if (search.isNotEmpty) {
      for (Shoe shoe in all) {
        shoe.name.contains(search) ? searchedShoes.add(shoe) : null;
      }
    }
    if (search.isEmpty) {
      searchedShoes.value = <Shoe>[];
    }
    isLoading.value = false;
  }
}
