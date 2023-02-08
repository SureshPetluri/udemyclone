

import 'package:get/get.dart';
import 'package:udemy_clone_ui/details/details_binding.dart';
import 'package:udemy_clone_ui/details/details_screen.dart';
import 'package:udemy_clone_ui/home/home_binding.dart';
import 'package:udemy_clone_ui/home/home_screen.dart';
import 'package:udemy_clone_ui/learn/learnScreen.dart';
import 'package:udemy_clone_ui/learn/learn_binding.dart';
import 'package:udemy_clone_ui/my_learnings/my_learnings_binding.dart';
import 'package:udemy_clone_ui/my_learnings/my_learnings_screen.dart';
import 'package:udemy_clone_ui/routes/appRoutes.dart';
import 'package:udemy_clone_ui/signin/signin_binding.dart';
import 'package:udemy_clone_ui/signin/signin_view.dart';

class AppPages {
  static getPageWithTransition(
          {String? name,
          GetPageBuilder? page,
          Bindings? binding,
          List<Bindings>? bindings,
          transition = Transition.rightToLeft,
          duration = 250}) =>
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
    // getPageWithTransition(
    //   name: AppRoutes.terms,
    //   page: () => TermsAndConditionsPage(),
    //   binding: TermsAndConditionsBinding(),
    // ),

    /// Login Page
    getPageWithTransition(
        name: AppRoutes.signIn,
        page: () => const SignInScreen(),
        binding: SignInBinding(),
        duration: 0),

    /// Install bottom nav Page
    getPageWithTransition(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),

    /// Install bottom nav Page
    getPageWithTransition(
      name: AppRoutes.learn,
      page: () => LearnScreen(),
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
