import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/modules/shop_app/search/cubit/cubit.dart';
import 'package:shop/modules/shop_app/search/cubit/states.dart';
import 'package:shop/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          appBar: AppBar(),
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  defaultFormField(
                    controller: searchController,
                    type: TextInputType.text,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'enter text to search';
                      }
                    },
                    onSubmit: (value) {
                      SearchCubit.get(context).search(value);
                    },
                    label: 'Search',
                    prefix: Icons.search,
                  ),
                  const SizedBox(height: 10),
                  if (state is SearchLoadingState)
                    const LinearProgressIndicator(),
                  const SizedBox(height: 10),
                  if (state is SearchSuccessState)
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => buildListProduct(
                          SearchCubit.get(context).model.data!.data![index],
                          context,
                          isOldPrice: false,
                        ),
                        separatorBuilder: (context, index) => myDivider(),
                        itemCount:
                            SearchCubit.get(context).model.data!.data!.length,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
