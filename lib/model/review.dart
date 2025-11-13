import 'package:first_wtf_app/model/user_detail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review.g.dart';

@JsonSerializable()
class Review {
  final String message;
  final UserDetail user;
  final DateTime date;

  Review({required this.message, required this.user, required this.date});

  Map<String, dynamic> toJson() => _$ReviewToJson(this);

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}
