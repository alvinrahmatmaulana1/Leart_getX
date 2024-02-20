import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../views/output.dart';

class InvoiceController extends GetxController {
  //TODO: Implement InvoiceController
  var fullname = ''.obs;
  var placeofbirth = ''.obs;
  var dateofbirth = ''.obs;
  var gender = ''.obs;
  var email = ''.obs;
  var state = ''.obs;
  var harga = ''.obs;
  var age = ''.obs;
  var benefits = ''.obs;
  // final List<String> membershipList = [
  //   'Reguler',
  //   'Gold',
  //   'Platinum',
  //   'VIP',
  // ];

  var membership = ''.obs;

  // List<String> getMembershipList()=>membershipList;

  var isFormSubmitted = false.obs;

  Future<void> dateOfBirdth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());

    if (picked != null) {
      final formattedDate = DateTime.now();
      final ageResult = formattedDate.year -
          picked.year -
          ((formattedDate.month > picked.month ||
                  (formattedDate.month == picked.month &&
                      formattedDate.day >= picked.day))
              ? 0
              : 1);
              dateofbirth.value = DateFormat('yyyy-MM-dd').format(picked);
              age.value = ageResult.toString();
    }
  }

  var card_number = ''.obs;
  var expired_date = ''.obs;

  Future<void> expiredDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100));

    if (picked != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      expired_date.value = formattedDate;
    }
  }

  void toggleMembership(String membershipValue) {
    // if (membership.contains(membershipValue)) {
    //   membership.remove(membershipValue);
    // } else {
    //   membership.add(membershipValue);
    // }
    membership.value = membershipValue;
    if (membership == "Reguler") {
      harga.value = "50000";
      benefits.value = "Anggoata 1 Bulan";
    } else if (membership == "Gold") {
      harga.value = "150000";
      benefits.value = "Anggoata 1 Bulan + Cemilan Gratis";
    } else if (membership == "Platinum") {
      harga.value = "250000";
      benefits.value = "Anggoata 2 Bulan + Cemilan Gratis + Free Wifi";
    } else if (membership == "VIP") {
      harga.value = "500000";
      benefits.value =
          "Anggoata 3 Bulan + Cemilan Gratis + Free Wifi + Tiket Konser";
    }
  }

   void resetData() {
    fullname.value = '';
    placeofbirth.value = '';
    dateofbirth.value = '';
    gender.value = '';
    email.value = '';
    state.value = '';
    membership.value = '';
    card_number.value = '';
    expired_date.value = '';
    harga.value = '';
    benefits.value = '';
  }

  void sumbitForm() {
    print(
        'Data formulir: $fullname,$placeofbirth,$dateofbirth,$gender,$email,$state,${membership.value},${harga.value},${benefits.value}');
    isFormSubmitted.value = true;
    Get.to(OutPut());
  }
}
