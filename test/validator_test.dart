import 'package:flutter_test/flutter_test.dart';
import 'package:first_wtf_app/utils/validator.dart';

void main() {
  group('Validator Tests', () {
    test('validateEmail returns error when email is empty', () {
      final result = Validator.validateEmail('');
      expect(result, 'Email is required');
    });

    test('validateEmail returns error when email is null', () {
      final result = Validator.validateEmail(null);
      expect(result, 'Email is required');
    });

    test('validateEmail returns error when email is invalid', () {
      final result = Validator.validateEmail('invalid-email');
      expect(result, 'Enter a valid email address');
    });

    test('validateEmail returns null when email is valid', () {
      final result = Validator.validateEmail('test@example.com');
      expect(result, isNull);
    });

    test('validatePassword returns error when password is too short', () {
      final result = Validator.validatePassword('123');
      expect(result, 'Password must be at least 6 characters long');
    });

    test('validatePassword returns null when password is valid', () {
      final result = Validator.validatePassword('password123');
      expect(result, isNull);
    });

    test('validateName returns error when name is empty', () {
      final result = Validator.validateName('');
      expect(result, 'Name is required');
    });

    test('validateName returns null when name is provided', () {
      final result = Validator.validateName('John Doe');
      expect(result, isNull);
    });
  });
}
