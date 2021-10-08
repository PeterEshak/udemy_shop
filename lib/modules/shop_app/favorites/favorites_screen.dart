import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/layout/shop_app/cubit/cubit.dart';
import 'package:shop/layout/shop_app/cubit/states.dart';
import 'package:shop/shared/components/components.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          child: ShopCubit.get(context).favoritesModel== null || ShopCubit.get(context).favoritesModel!.data! == null
              ? ListView.separated(
                  itemBuilder: (context, index) => buildListProduct(
                    ShopCubit.get(context)
                        .favoritesModel!.data!
                        .data![index]
                        .product!,
                    context,
                  ),
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount: ShopCubit.get(context)
                      .favoritesModel!.data!
                      .data!
                      .length, // Null check operator used on a null value: favoritesModel!.data!
                )
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
    //     return Container(
    //       child: state is! ShopLoadingGetFavoritesState
    //           ? ListView.separated(
    //               itemBuilder: (context, index) => buildListProduct(
    //                 ShopCubit.get(context)
    //                     .favoritesModel!
    //                     .data!
    //                     .data[index]
    //                     .product!,
    //                 context,
    //               ),
    //               separatorBuilder: (context, index) => myDivider(),
    //               itemCount: ShopCubit.get(context)
    //                   .favoritesModel!
    //                   .data!
    //                   .data
    //                   .length, // Null check operator used on a null value: favoritesModel!.data!
    //             )
    //           : const Center(child: CircularProgressIndicator()),
    //     );
    //   },
    // );
  }
}
