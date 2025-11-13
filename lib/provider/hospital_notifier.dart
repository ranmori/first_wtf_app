import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_wtf_app/model/hospital.dart';
import 'package:flutter/material.dart';

class HospitalNotifier extends ChangeNotifier {
  List<Hospital> hospitals = [];

  HospitalNotifier(){
    fetchHospitals();
  }

  void fetchHospitals() async {
    QuerySnapshot<Map<String, dynamic>> query = await FirebaseFirestore.instance
        .collection("hospitals")
        .get();

    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in query.docs) {
      Map<String, dynamic> docData = doc.data();

      Hospital hospital = Hospital.fromJson(docData);

      hospitals.add(hospital);

      notifyListeners();
    }
  }
}
