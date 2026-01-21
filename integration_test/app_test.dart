import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:first_wtf_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Authentication Flow Integration Tests', () {
    testWidgets('Verify navigation between Login and Forgot Password pages', (WidgetTester tester) async {
      // 1. Start the app
      // Note: In some environments, Firebase.initializeApp() might need mock setup 
      // if not running on a real device/emulator with google-services.json
      app.main();
      await tester.pumpAndSettle();

      // 2. Verify we land on the Login Page
      expect(find.text('Welcome Back'), findsOneWidget);
      expect(find.text('Login'), findsOneWidget);

      // 3. Navigate to Forgot Password Page
      final forgotPasswordButton = find.text('Forgot Password?');
      await tester.tap(forgotPasswordButton);
      await tester.pumpAndSettle();

      // 4. Verify Forgot Password Page content
      expect(find.textContaining('recovery pin'), findsOneWidget);
      
      // 5. Interact with Forgot Password Page (Toggle OTP view)
      final getOtpButton = find.text('Get OTP');
      await tester.tap(getOtpButton);
      await tester.pumpAndSettle();

      // 6. Verify OTP view is shown
      expect(find.textContaining('enter the otp you received'), findsOneWidget);
    });

    testWidgets('Verify navigation from Login to Signup page', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Tap on "Sign up" link at the bottom of Login Page
      final signUpLink = find.text('Sign up');
      await tester.tap(signUpLink);
      await tester.pumpAndSettle();

      // Verify Signup Page content
      expect(find.text('Get Started'), findsOneWidget);
      expect(find.text('Create an account to continue'), findsOneWidget);
    });
  });
}

