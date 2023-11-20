import 'package:get/get.dart';
import '../core/constant/app_route.dart';
import '../core/middleware/initial_middleware.dart';
import '../view/screens/auth/login/login_screen.dart';
import '../view/screens/auth/sign up/sign_up_screen.dart';
import '../view/screens/contact/contact_screen.dart';
import '../view/screens/home/home_screen.dart';
import '../view/screens/initial/initial_screen.dart';
import '../view/screens/more/more_screen.dart';
import '../view/screens/onboarding/onboarding_screen.dart';
import '../view/screens/personal_chat/personal_chat_screen.dart';
import '../view/screens/splash/splash_screen.dart';

List<GetPage<dynamic>>? pages = [
  GetPage(name: AppRoute.splash, page: () => const SplashScreen()),
  GetPage(
      name: AppRoute.onboarding,
      page: () => const OnboardingScreen(),
      middlewares: [InitialMiddleware()]),
  GetPage(name: AppRoute.login, page: () => const LoginScreen()),
  GetPage(name: AppRoute.signup, page: () => const SignUpScreen()),
  GetPage(name: AppRoute.home, page: () => const HomeScreen()),
  GetPage(name: AppRoute.initial, page: () => const InitialScreen()),
  GetPage(name: AppRoute.more, page: () => const MoreScreen()),
  GetPage(name: AppRoute.contact, page: () => const ContactScreen()),
  GetPage(name: AppRoute.personalChat, page: () => const PersonalChatScreen()),
];
