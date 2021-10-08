// import 'package:flutter/material.dart';
// import 'package:shop/shared/cubit/cubit.dart';

// import 'package:splash_screen_view/SplashScreenView.dart';
// import 'layout/shop_app/shop_layout.dart';
// import 'main.dart';
// import 'modules/shop_app/login/shop_login_screen.dart';
// import 'modules/shop_app/on_boarding/on_boarding_screen.dart';
// import 'shared/network/local/cache_helper.dart';

// class SplashScreen extends StatelessWidget {
//   SplashScreen({Key? key}) : super(key: key);

//   final bool isDark = CacheHelper.getData(key: 'isDark')!;
//   final bool onBoarding = CacheHelper.getData(key: 'onBoarding')!;
//   final String token = CacheHelper.getData(key: 'token')!;

//   Widget screen() {
//     final Widget widget;
//     if (onBoarding != null) {
//       if (token != null)
//         widget = const ShopLayout();
//       else
//         widget = ShopLoginScreen();
//     } else {
//       widget = const OnBoardingScreen();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget splashScreen = SplashScreenView(
//       pageRouteTransition: PageRouteTransition.SlideTransition,
//       duration: 5000,
//       imageSize: 130,
//       imageSrc: 'assets/images/icon.jfif',
//       text: 'UDEMY',
//       textType: TextType.ColorizeAnimationText,
//       textStyle: const TextStyle(fontSize: 40.0),
//       colors: const [
//         Colors.purple,
//         Colors.blue,
//         Colors.yellow,
//         Colors.red,
//       ],
//       backgroundColor: Colors.white70,
//       // navigateRoute: const MyApp(),
//       navigateRoute: MyApp(
//         isDark: isDark,
//         startWidget: screen,
//       ),
//     );
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       themeMode:
//           AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
//       home: splashScreen,
//     );
//   }
// }
