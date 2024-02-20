import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  //TODO: Implement CounterController

  final count = 20.obs;

  void increment() {
     count.value++;
     
      if (count >= 50) {
       Get.snackbar(
        "Tong di Tambah Wae Euy Jadi Baradag",
        "Hayyo weh di tambah",
        colorText: Colors.white,
        backgroundColor: Colors.blue,
        icon: const Icon(Icons.announcement_rounded)
        );
     } 
    
    
  }
  void decrement() {
     count.value--;
     if (count <= 10) {
       Get.snackbar(
         "Tong di Kurang Wae Euy Teu Katingal",
        "Hayyo weh di kurang",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        icon: const Icon(Icons.announcement_rounded)
        );
     } 
  }
}
