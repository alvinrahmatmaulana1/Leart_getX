import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/invoice_controller.dart';

class InvoiceView extends StatelessWidget {
  // InvoiceView({Key? key}) : super(key: key);
  final InvoiceController invoice = Get.put( InvoiceController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InvoiceView'),
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: Text("Personal Infomatian"),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Full Name'),
                      onChanged: (value) => 
                      invoice.fullname.value = value,
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Place Of Birth'),
                      onChanged: (value) => 
                      invoice.placeofbirth.value = value,
                    ),
                    SizedBox(height: 16.0),
                    InkWell(
                      onTap: () => invoice.dateOfBirdth(context),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Date Of Birth',
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           
                            Obx(() => Text(invoice.dateofbirth.value))
                          ],
                        ),
                        
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Row(
                          children: [
                            Text("Gender"),
                            Obx(() => Radio(
                              value: 'Laki-Laki',
                              groupValue: invoice.gender.value, 
                              onChanged: (value) => 
                              invoice.gender.value=value!,
                              )),
                          ],
                        ),
                          Text('Laki-Laki'),
                          Obx(() => Radio(
                          value: 'Perempuan', 
                          groupValue: invoice.gender.value, 
                          onChanged: (value) => 
                          invoice.gender.value=value!,
                          )),
                          Text('Perempuan')
                      ],
                    ),
                     SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      onChanged: (value) => 
                      invoice.email.value = value,
                    ),
                     SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Nationality'),
                      onChanged: (value) => 
                      invoice.state.value = value,
                    ),
                    SizedBox(height: 16.0),
                     Container(
                      child: Text("Type Of Membership"),

                    ),
                     Row(
                      children: [
                        Row(
                          children: [
                            Obx(() => Radio(
                              value: 'Reguler',
                              groupValue: invoice.membership.value, 
                              onChanged: (value) => 
                              invoice.toggleMembership( value!) ,
                              )),
                          ],
                        ),
                          Text('Reguler'),
                          Row(
                            children: [
                              Obx(() => Radio(
                              value: 'Gold', 
                              groupValue: invoice.membership.value, 
                              onChanged: (value) => 
                              invoice.toggleMembership( value!),
                              )),
                            ],
                          ),
                          Text('Gold'),
                          Row(
                            children: [
                              Obx(() => Radio(
                              value: 'Platinum', 
                              groupValue: invoice.membership.value, 
                              onChanged: (value) => 
                              invoice.toggleMembership( value!),
                              )),
                            ],
                          ),
                          Text('Platinum'),
                          Row(
                            children: [
                              Obx(() => Radio(
                              value: 'VIP', 
                              groupValue: invoice.membership.value, 
                              onChanged: (value) => 
                              invoice.toggleMembership( value!),
                              )),
                            ],
                          ),
                          Text('VIP')
                      ],
                    ),
                     Container(
                      child: Text("Payment Detail"),

                    ),
                     TextFormField(
                      decoration: InputDecoration(labelText: 'Card Number'),
                      onChanged: (value) => 
                      invoice.card_number.value = value,
                    ),
                     SizedBox(height: 16.0),
                    InkWell(
                      onTap: () => invoice.expiredDate(context),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Date Of Birth',
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           
                            Obx(() => Text(invoice.expired_date.value))
                          ],
                        ),
                        
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Obx(() => Text('Harga Member : ${invoice.harga.value}')),

                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () => invoice.sumbitForm(), 
                      child: Text('Sumbit'),
                      ),
                    Obx(
                      () => invoice.isFormSubmitted.value 
                       ?Text("")
                       : SizedBox.shrink()
                    )
                  ],
                )
                ),
               
            ]
            ),
        ),
      )
    );
  }
}
