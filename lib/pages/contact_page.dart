import 'package:first_wtf_app/widgets/hospital_list.dart';
import 'package:flutter/material.dart';

import '../widgets/contact_item.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Contacts"), centerTitle: true),
      body: HospitalList(),
    );
  }
}
