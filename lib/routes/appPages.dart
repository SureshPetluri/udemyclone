

import 'package:get/get.dart';

import '../card_payment/card_binding.dart';
import '../card_payment/card_view.dart';
import '../details/details_binding.dart';
import '../details/details_screen.dart';
import '../home/home_binding.dart';
import '../home/home_screen.dart';
import '../learn/learnScreen.dart';
import '../learn/learn_binding.dart';
import '../mobile_details/mobile_detail_screen.dart';
import '../mobile_details/mobile_details_binding.dart';
import '../my_learnings/my_learnings_binding.dart';
import '../my_learnings/my_learnings_screen.dart';
import 'appRoutes.dart';

class AppPages {
  static getPageWithTransition(
          {String? name,
          GetPageBuilder? page,
          Bindings? binding,
          List<Bindings>? bindings,
          transition = Transition.rightToLeft,
          duration = 750}) =>
      GetPage(
          name: name!,
          page: page!,
          binding: binding,
          bindings: bindings ?? [],
          transition: transition,
          transitionDuration: Duration(milliseconds: duration));

  static final List<GetPage> pages = [
    /// splash Screen Page
    // getPageWithTransition(
    //     name: AppRoutes.splashScreen,
    //     page: () => SplashScreen(),
    //     binding: SplashScreenBinding(),
    //     transition: Transition.fade),

    /// Terms And Conditions page
    getPageWithTransition(
      name: AppRoutes.cardScreen,
      page: () => CardScreen(),
      binding: CardBinding(),
    ),

    /// Login Page
    getPageWithTransition(
        name: AppRoutes.mobileDetails,
        page: () =>  MobileDetailsScreen(),
        binding: MobileDetailsBinding(),
        duration: 0),

    /// Install bottom nav Page
    getPageWithTransition(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),

    /// Install bottom nav Page
    getPageWithTransition(
      name: AppRoutes.learn,
      page: () =>  LearnScreen(),
      binding: LearnBinding(),
    ),

    /// Device Information Page
    getPageWithTransition(
      name: AppRoutes.details,
      page: () => DetailsScreen(),
      binding: DetailsBinding(),
    ),

    getPageWithTransition(
      name: AppRoutes.myLearnings,
      page: () => MyLearningsScreen(),
      binding: MyLearningsBinding(),
    ),
    /// Forgot Password Page
    // getPageWithTransition(
    //   name: AppRoutes.forgotPassword,
    //   page: () => ForgotPassword(),
    //   binding: ForgotPasswordPageBinding(),
    // ),

    /// reset Password Page
    // getPageWithTransition(
    //   name: AppRoutes.verifyPassword,
    //   page: () => VerifyPassword(),
    //   binding: VerifyPasswordPageBinding(),
    // ),




    /// Change Password Page
    // getPageWithTransition(
    //   name: AppRoutes.changePassword,
    //   page: () => ChangePasswordPage(),
    //   binding: ChangePasswordPageBinding(),
    // ),
    //
    // /// user profile Page
    // getPageWithTransition(
    //   name: AppRoutes.userprofile,
    //   page: () => UserProfile(),
    //   binding: UserProfileBinding(),
    // ),


  ];
}
