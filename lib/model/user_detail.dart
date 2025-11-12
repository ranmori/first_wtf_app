class UserDetail {
  const UserDetail({
    required this.name,
    this.profilePicture = "",
    required this.email,
    this.phoneNumber = "",
    this.address = "",
    this.occupation = "",
  });

  final String name;
  final String profilePicture;
  final String email;
  final String phoneNumber;
  final String address;
  final String occupation;

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "email": this.email,
      "phoneNumber": this.phoneNumber,
      "address": this.address,
      "profilePicture": this.profilePicture,
      "occupation": this.occupation,
    };
  }

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
      name: json["name"],
      email: json["email"],
      address: json["address"],
      occupation: json["occupation"],
      profilePicture: json["profilePicture"],
    );
  }
}
