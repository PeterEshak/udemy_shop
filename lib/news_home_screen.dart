import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../layout/news_app/cubit/cubit.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

import 'layout/news_app/news_layout.dart';

/* void main() async {
  // بيتأكد ان كل حاجه هنا في الميثوت خلصت و بعدين يفتح الابليكشن
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool isDark = CacheHelper.getBoolean(key: 'isDark')!;

  runApp(NewsHomeScreen());
  // runApp(NewsHomeScreen(isDark: isDark));
}
 */
class NewsHomeScreen extends StatelessWidget {
  // final bool isDark;

  const NewsHomeScreen({Key? key}) : super(key: key);

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
          create: (context) => AppCubit()..changeAppMode(),
          // create: (context) => AppCubit()..changeAppMode(fromShared: isDark),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) => const NewsLayout(),
        //const MaterialApp(
          //debugShowCheckedModeBanner: false,
          //home: NewsLayout(),
          // home: Directionality(
          //     textDirection: TextDirection.ltr,
          //     child: const NewsLayout()
          // ),
        // ),
      ),
    );
  }
}
