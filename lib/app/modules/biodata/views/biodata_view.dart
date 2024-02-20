import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/biodata_controller.dart';
import 'package:intl/intl.dart';
class BiodataView extends StatelessWidget {
  BiodataView({Key? key}) : super(key: key);

  final BiodataController biodataController = BiodataController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BiodataView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Nama'),
                      onChanged: (value) => 
                      biodataController.nama.value = value,
                    ),
                    SizedBox(height: 16.0),
                    InkWell(
                      onTap: () => biodataController.selecteDate(context),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Tanggal Lahir',
                          hintText: 'Pilih Tanggal'
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Tanggal Lahir'),
                            Obx(() => Text(biodataController.tanggallahir.value))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    DropdownButtonFormField(
                      items: ['Islam','Kristen','Hindu','Budha','Lainnya']
                      .map((agama) => DropdownMenuItem(
                        value: agama, child: Text(agama)))
                        .toList(), 
                      onChanged: (value) => 
                      biodataController.agama.value = value.toString(),
                      decoration: InputDecoration(labelText: 'Agama'),
                      ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Obx(() => Radio(
                          value: 'Laki-Laki',
                          groupValue: biodataController.jeniskelamin.value, 
                          onChanged: (value) => 
                          biodataController.jeniskelamin.value=value!,
                          )),
                          Text('Laki-Laki'),
                          Obx(() => Radio(
                          value: 'Perempuan', 
                          groupValue: biodataController.jeniskelamin.value, 
                          onChanged: (value) => 
                          biodataController.jeniskelamin.value=value!,
                          )),
                          Text('Perempuan')
                      ],
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      maxLines: 3,
                      decoration: InputDecoration(labelText: 'Alamat'),
                      onChanged: (value) => 
                      biodataController.alamat.value = value,
                    ),
                    SizedBox(height: 16.0),
                    for (String hobi in biodataController.getHobiList())
                    Obx(() => CheckboxListTile(
                      title: Text(hobi),
                      value: biodataController.hobi.contains(hobi), 
                      onChanged: (value) =>
                      biodataController.toggleHobi(hobi), 
                      )),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () => biodataController.sumbitForm(), 
                      child: Text('Sumbit'),
                      )
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Obx(() {
                if (biodataController.isFormSubmitted.value) {
                  return Text(
                    'Output: ${biodataController.nama}, ${biodataController.tanggallahir}, ${biodataController.agama}, ${biodataController.jeniskelamin}, ${biodataController.alamat}, ${biodataController.hobi}',
                    style: TextStyle(fontSize: 16.0),
                  );
                }
                else {
                  return SizedBox.shrink();
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
