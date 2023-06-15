import 'package:flutter/material.dart';
import 'package:foodninja/app/core/mixin/theme_mixin.dart';
import 'package:foodninja/app/core/services/image/image_service.dart';
import 'package:foodninja/app/modules/authentication/login/login_page.dart';
import 'package:foodninja/app/modules/authentication/reset_password/reset_password_page.dart';
import 'package:foodninja/app/modules/authentication/signup/controllers/set_location_controller.dart';
import 'package:foodninja/app/modules/authentication/signup/controllers/upload_image_controller.dart';
import 'package:foodninja/app/modules/authentication/signup/pages/payment_method_page.dart';
import 'package:foodninja/app/modules/authentication/signup/pages/reset_success_password_page.dart';
import 'package:foodninja/app/modules/authentication/signup/pages/set_location_page.dart';
import 'package:foodninja/app/modules/authentication/signup/pages/signup_page.dart';
import 'package:foodninja/app/modules/authentication/signup/pages/signup_process_page.dart';
import 'package:foodninja/app/modules/authentication/signup/pages/signup_success_notification_page.dart';
import 'package:foodninja/app/modules/authentication/signup/pages/upload_image_page.dart';
import 'package:foodninja/app/modules/authentication/signup/pages/verification_code_page.dart';
import 'package:foodninja/app/modules/authentication/signup/pages/via_method_page.dart';
import 'package:foodninja/app/modules/onboarding/onboarding_page.dart';
import 'package:foodninja/app/modules/onboarding/splash_page.dart';
import 'package:foodninja/main.dart';

import 'core/theme/app_theme.dart';

class AppWidget extends StatelessWidget with ThemeMixin {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: generateMaterialColor(
          const Color(0xFF15BE77),
        ),
        materialTapTargetSize: MaterialTapTargetSize.padded,
        buttonTheme: const ButtonThemeData(minWidth: 0),
        primaryColor: const Color(0xFF15BE77),
      ).copyWith(
        scaffoldBackgroundColor: Colors.white,
        extensions: [
          const AppTheme(
            black: Color(0xFF09051C),
            deepBlack: Color(0xFF444352),
            middleBlack: Color(0xFF86848F),
            lightBlack: Color(0xFFCECDD2),
            deepYellow: Color(0xFFFFC668),
            middleYellow: Color(0xFFFFDEA4),
            lightYellow: Color(0xFFFEF8E0),
            yellow: Color(0xFFFFAD1D),
            orange: Color(0xFFDA6317),
            deepOrange: Color(0xFFE38751),
            lightOrange: Color(0xFFE3CBBC),
            middleOrange: Color(0xFFE6A986),
            green: Color(0xFF15BE77),
            darkGreen: Color(0xFF53E88B),
            white: Colors.white,
            grey: Color(0xFFF4F4F4),
          ),
        ],
      ),
      routes: {
        '/': (context) => const SplashPage(),
        '/first-step-onboarding': (context) => const FirstStepOnboardingPage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/signup-process': (context) => const SignupProcessPage(),
        '/payment-method': (context) => const PaymentMethodPage(),
        '/upload-image': (context) {
          return UploadImagePage(
            imageService: getIt.get<ImageService>(),
            uploadImageController: getIt.get<UploadImageController>(),
          );
        },
        '/set-location': (context) => SetLocationPage(
              setLocationController: getIt.get<SetLocationController>(),
            ),
        '/signup-success-notification': (context) {
          return const SignupSuccessNotificationPage();
        },
        '/verification-code': (context) {
          return const VerificationCodePage();
        },
        '/via-method': (context) {
          return const ViaMethodPage();
        },
        '/password': (context) {
          return const ResetPasswordPage();
        },
        '/reset-password-success': (context) {
          return const ResetPasswordSuccessPage();
        },
      },
    );
  }
}
