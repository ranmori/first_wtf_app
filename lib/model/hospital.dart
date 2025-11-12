import 'package:first_wtf_app/model/review.dart';
import 'package:first_wtf_app/model/user_detail.dart';

class Hospital {
  final String id;
  final String address;
  final String name;
  final String description;
  final int numberOfAmbulances;
  final int rating;
  final String website;
  final List<String> phoneNumber;
  final List<Review> reviews;

  Hospital({
    required this.id,
    required this.address,
    required this.name,
    this.description = "",
    required this.numberOfAmbulances,
    this.rating = 0,
    required this.website,
    required this.phoneNumber,
    this.reviews = const [],
  });
}
