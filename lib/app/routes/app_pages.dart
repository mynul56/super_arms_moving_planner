import 'package:get/get.dart';

import '../modules/auth/congratulations/bindings/congratulations_binding.dart';
import '../modules/auth/congratulations/views/congratulations_view.dart';
import '../modules/auth/document_upload/bindings/document_upload_binding.dart';
import '../modules/auth/document_upload/views/document_upload_view.dart';
import '../modules/auth/forgotpassword/bindings/forgotpassword_binding.dart';
import '../modules/auth/forgotpassword/views/forgotpassword_view.dart';
import '../modules/auth/otp_verification/bindings/otp_verification_binding.dart';
import '../modules/auth/otp_verification/views/otp_verification_view.dart';
import '../modules/auth/register/bindings/register_binding.dart';
import '../modules/auth/register/views/register_view.dart';
import '../modules/auth/register_company/bindings/register_company_binding.dart';
import '../modules/auth/register_company/views/register_company_view.dart';
import '../modules/auth/resetpassword/bindings/resetpassword_binding.dart';
import '../modules/auth/resetpassword/views/resetpassword_view.dart';
import '../modules/auth/sign_up/bindings/sign_up_binding.dart';
import '../modules/auth/sign_up/views/sign_up_view.dart';
import '../modules/auth/signin/bindings/signin_binding.dart';
import '../modules/auth/signin/views/signin_view.dart';
import '../modules/auth/submission_complete/bindings/submission_complete_binding.dart';
import '../modules/auth/submission_complete/views/submission_complete_view.dart';
import '../modules/available_offers/bindings/available_offers_binding.dart';
import '../modules/available_offers/views/available_offers_view.dart';
import '../modules/client_profile/bindings/client_profile_binding.dart';
import '../modules/client_profile/views/client_profile_view.dart';
import '../modules/clients/bindings/clients_binding.dart';
import '../modules/clients/views/clients_view.dart';
import '../modules/concierge_details/bindings/concierge_details_binding.dart';
import '../modules/concierge_details/views/concierge_details_view.dart';
import '../modules/delivery_proof/bindings/delivery_proof_binding.dart';
import '../modules/delivery_proof/views/delivery_proof_view.dart';
import '../modules/details/bindings/details_binding.dart';
import '../modules/details/views/details_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/installment/bindings/installment_binding.dart';
import '../modules/installment/views/installment_view.dart';
import '../modules/installment/views/order_details_view.dart';
import '../modules/inventory/bindings/inventory_binding.dart';
import '../modules/inventory/views/inventory_view.dart';
import '../modules/live_tracking/bindings/live_tracking_binding.dart';
import '../modules/live_tracking/views/live_tracking_view.dart';
import '../modules/move_without_truck_details/bindings/move_without_truck_details_binding.dart';
import '../modules/move_without_truck_details/views/move_without_truck_details_view.dart';
import '../modules/moving_planner_details/bindings/moving_planner_details_binding.dart';
import '../modules/moving_planner_details/views/moving_planner_details_view.dart';
import '../modules/notifications/bindings/notifications_binding.dart';
import '../modules/notifications/views/notifications_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/payment/bindings/payment_binding.dart';
import '../modules/payment/bindings/payment_details_binding.dart';
import '../modules/payment/views/payment_details_view.dart';
import '../modules/payment/views/payment_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/add_employee_view.dart';
import '../modules/profile/views/edit_document_view.dart';
import '../modules/profile/views/edit_profile_view.dart';
import '../modules/profile/views/manage_company_view.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/profile/views/update_card_info_view.dart';
import '../modules/route/bindings/route_binding.dart';
import '../modules/route/views/route_view.dart';
import '../modules/route_offers/bindings/route_offers_binding.dart';
import '../modules/route_offers/views/route_offers_view.dart';
import '../modules/search_offers/bindings/search_offers_binding.dart';
import '../modules/search_offers/views/search_offers_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/waybill/bindings/waybill_binding.dart';
import '../modules/waybill/views/waybill_view.dart';
import '../modules/update_status/bindings/update_status_binding.dart';
import '../modules/update_status/views/update_status_view.dart';

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
      name: _Paths.LIVE_TRACKING,
      page: () => const LiveTrackingView(),
      binding: LiveTrackingBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => const PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_DETAILS,
      page: () => const PaymentDetailsView(),
      binding: PaymentDetailsBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_OFFERS,
      page: () => const SearchOffersView(),
      binding: SearchOffersBinding(),
    ),
    GetPage(
      name: _Paths.DETAILS,
      page: () => const DetailsView(),
      binding: DetailsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_CARD_INFO,
      page: () => const UpdateCardInfoView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.WAYBILL,
      page: () => const WaybillView(),
      binding: WaybillBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_DOCUMENT,
      page: () => const EditDocumentView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.MANAGE_COMPANY,
      page: () => const ManageCompanyView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ADD_EMPLOYEE,
      page: () => const AddEmployeeView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.MOVING_PLANNER_DETAILS,
      page: () => const MovingPlannerDetailsView(),
      binding: MovingPlannerDetailsBinding(),
    ),
    GetPage(
      name: _Paths.CONCIERGE_DETAILS,
      page: () => const ConciergeDetailsView(),
      binding: ConciergeDetailsBinding(),
    ),
    GetPage(
      name: _Paths.MOVE_WITHOUT_TRUCK_DETAILS,
      page: () => const MoveWithoutTruckDetailsView(),
      binding: MoveWithoutTruckDetailsBinding(),
    ),
    GetPage(
      name: _Paths.DELIVERY_PROOF,
      page: () => const DeliveryProofView(),
      binding: DeliveryProofBinding(),
    ),
    GetPage(
      name: _Paths.ROUTE,
      page: () => const RouteView(),
      binding: RouteBinding(),
    ),
    GetPage(
      name: _Paths.ROUTE_OFFERS,
      page: () => const RouteOffersView(),
      binding: RouteOffersBinding(),
    ),
    GetPage(
      name: _Paths.CLIENTS,
      page: () => const ClientsView(),
      binding: ClientsBinding(),
    ),
    GetPage(
      name: _Paths.CLIENT_PROFILE,
      page: () => const ClientProfileView(),
      binding: ClientProfileBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: _Paths.INSTALLMENTS,
      page: () => const InstallmentView(),
      binding: InstallmentBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_DETAILS,
      page: () => const OrderDetailsView(),
      binding: InstallmentBinding(),
    ),
    GetPage(
      name: _Paths.INVENTORY,
      page: () => const InventoryView(),
      binding: InventoryBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_STATUS,
      page: () => const UpdateStatusView(),
      binding: UpdateStatusBinding(),
    ),
  ];
}
