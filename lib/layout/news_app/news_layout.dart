import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/news_app/search/search_screen.dart';
import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../layout/news_app/cubit/cubit.dart';
import '../../layout/news_app/cubit/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () => navigateTo(context, SearchScreen()),
              ),
              IconButton(
                icon: const Icon(Icons.brightness_4_outlined),
                onPressed: () => AppCubit.get(context).changeAppMode(),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) => cubit.changeBottomNavBar(index),
            items: cubit.bottomItems,
          ),
        );
      },
    );
  }
}
