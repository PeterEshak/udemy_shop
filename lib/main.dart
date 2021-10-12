import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout/todo_app/todo_layout.dart';
import 'news_home_screen.dart';
import 'shared/bloc_observer.dart';
import 'shared/network/local/cache_helper.dart';
import 'shared/network/remote/dio_helper.dart';
import 'layout/shop_app/cubit/cubit.dart';
import 'modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'shared/cubit/cubit.dart';
import 'shared/cubit/states.dart';
import 'shared/styles/themes.dart';
import 'layout/news_app/cubit/cubit.dart';
import 'layout/shop_app/shop_layout.dart';
import 'modules/bmi_app/bmi/bmi_screen.dart';
import 'modules/shop_app/login/shop_login_screen.dart';

void main() async {
  // login

  // 1. checkout master
  // 2. update master
  // 3. create branch from master
  // 4. code ....
  // 5. commit
  // 6. checkout master
  // 7. update master
  // 8. checkout your local branch
  // 9. merge master with my current branch
  // 10. push
  // 11. create pull request

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  DioHelperShop.init();
  await CacheHelper.init();

  bool isDark = CacheHelper.getData(key: 'isDark')!;
  Widget widget;
  bool onBoarding;
  CacheHelper.getData(key: 'onBoarding') == null
      ? onBoarding = false
      : onBoarding = CacheHelper.getData(key: 'onBoarding');
  String token;
  CacheHelper.getData(key: 'token') == null
      ? token = ''
      : token = CacheHelper.getData(key: 'token');

  if (onBoarding != null) {
    if (token != null)
      widget = const ShopLayout();
    else
      widget = ShopLoginScreen();
  } else
    widget = const OnBoardingScreen();

  // runApp(const SplashScreen());
  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
  // runApp(
  //   Builder(
  //     builder: (context) {
  //       if(MediaQuery.of(context).size.width.toInt() <= 560)
  //         return MediaQuery(data: MediaQuery.of(context).copyWith(
  //           textScaleFactor: .7,
  //         ),child: const MobileScreen());
  //       return MediaQuery(data: MediaQuery.of(context).copyWith(
  //         textScaleFactor: 1.25,
  //       ),child: const DesktopScreen());
  //     },
  //   ),
  // );
  // runApp(
  //   LayoutBuilder(
  //     builder: (context, constraints) {
  //       if(constraints.minWidth.toInt() <= 560)
  //         return const MobileScreen();
  //       return const DesktopScreen();
  //     },
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  final Widget? startWidget;

  const MyApp({
    Key? key,
    required this.isDark,
    required this.startWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBusiness()
            ..getSports()
            ..getScience(),
        ),
        BlocProvider(
          create: (context) => AppCubit()..changeAppMode(fromShared: isDark),
        ),
        BlocProvider(
          create: (context) => ShopCubit()
            ..getHomeData()
            ..getCategories()
            ..getFavorites()
            ..getUserData(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode:
              AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
          home: startWidget,
          // home: onBoarding ? ShopLoginScreen() : const OnBoardingScreen(),
          // initialRoute: '/news',
          routes: {
            '/news': (context) => const NewsHomeScreen(),
            // '/news': (context) => NewsHomeScreen(isDark: isDark),
            '/bmi': (context) => const BmiScreen(),
            '/todo': (context) => const TodoLayout(),
            // '/splash': (context) => SplashScreen(),
            '/onBoarding': (context) => const OnBoardingScreen(),
          },
        ),
      ),
    );
  }
}
