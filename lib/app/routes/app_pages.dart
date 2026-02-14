import 'package:get/get.dart';

import '../modules/auth/congratulations/bindings/congratulations_binding.dart';
import '../modules/auth/congratulations/views/congratulations_view.dart';
import '../modules/auth/document_upload/bindings/document_upload_binding.dart';
import '../modules/auth/document_upload/views/document_upload_view.dart';
import '../modules/auth/otp_verification/bindings/otp_verification_binding.dart';
import '../modules/auth/otp_verification/views/otp_verification_view.dart';
import '../modules/auth/register/bindings/register_binding.dart';
import '../modules/auth/register/views/register_view.dart';
import '../modules/auth/register_company/bindings/register_company_binding.dart';
import '../modules/auth/register_company/views/register_company_view.dart';
import '../modules/auth/sign_up/bindings/sign_up_binding.dart';
import '../modules/auth/sign_up/views/sign_up_view.dart';
import '../modules/auth/signin/bindings/signin_binding.dart';
import '../modules/auth/signin/views/signin_view.dart';
import '../modules/auth/submission_complete/bindings/submission_complete_binding.dart';
import '../modules/auth/submission_complete/views/submission_complete_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/auth/forgotpassword/bindings/forgotpassword_binding.dart';
import '../modules/auth/forgotpassword/views/forgotpassword_view.dart';
import '../modules/auth/resetpassword/bindings/resetpassword_binding.dart';
import '../modules/auth/resetpassword/views/resetpassword_view.dart';
import '../modules/available_offers/bindings/available_offers_binding.dart';
import '../modules/available_offers/views/available_offers_view.dart';
import '../modules/search_offers/bindings/search_offers_binding.dart';
import '../modules/search_offers/views/search_offers_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.OTP_VERIFICATION,
      page: () => const OtpVerificationView(),
      binding: OtpVerificationBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_COMPANY,
      page: () => const RegisterCompanyView(),
      binding: RegisterCompanyBinding(),
    ),
    GetPage(
      name: _Paths.DOCUMENT_UPLOAD,
      page: () => const DocumentUploadView(),
      binding: DocumentUploadBinding(),
    ),
    GetPage(
      name: _Paths.SUBMISSION_COMPLETE,
      page: () => const SubmissionCompleteView(),
      binding: SubmissionCompleteBinding(),
    ),
    GetPage(
      name: _Paths.CONGRATULATIONS,
      page: () => const CongratulationsView(),
      binding: CongratulationsBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotpasswordView(),
      binding: ForgotpasswordBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetpasswordView(),
      binding: ResetpasswordBinding(),
    ),
    GetPage(
      name: _Paths.AVAILABLE_OFFERS,
      page: () => const AvailableOffersView(),
      binding: AvailableOffersBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_OFFERS,
      page: () => const SearchOffersView(),
      binding: SearchOffersBinding(),
    ),
  ];
}
