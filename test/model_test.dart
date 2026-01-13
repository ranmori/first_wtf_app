import 'package:flutter_test/flutter_test.dart';
import 'package:first_wtf_app/model/user_detail.dart';

void main() {
  group('UserDetail Model Tests', () {
    test('UserDetail.fromJson creates a valid object', () {
      final json = {
        "name": "John Doe",
        "email": "john@example.com",
        "address": "123 Main St",
        "occupation": "Doctor",
        "profilePicture": "https://example.com/pic.jpg",
      };

      final user = UserDetail.fromJson(json);

      expect(user.name, 'John Doe');
      expect(user.email, 'john@example.com');
      expect(user.address, '123 Main St');
      expect(user.occupation, 'Doctor');
      expect(user.profilePicture, 'https://example.com/pic.jpg');
    });

    test('UserDetail.toJson returns correct map', () {
      const user = UserDetail(
        name: 'Jane Doe',
        email: 'jane@example.com',
        address: '456 Side St',
      );

      final json = user.toJson();

      expect(json['name'], 'Jane Doe');
      expect(json['email'], 'jane@example.com');
      expect(json['address'], '456 Side St');
    });
  });
}
