import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/layout/shop_app/cubit/states.dart';
import 'package:shop/models/shop_app/categories_model.dart';
import 'package:shop/models/shop_app/change_favorites_model.dart';
import 'package:shop/models/shop_app/favorites_model.dart';
import 'package:shop/models/shop_app/home_model.dart';
import 'package:shop/models/shop_app/login_model.dart';
import 'package:shop/modules/shop_app/categories/categories_screen.dart';
import 'package:shop/modules/shop_app/favorites/favorites_screen.dart';
import 'package:shop/modules/shop_app/products/products_screen.dart';
import 'package:shop/modules/shop_app/settings/settings_screen.dart';
import 'package:shop/shared/components/constants.dart';
import 'package:shop/shared/network/end_points.dart';
import 'package:shop/shared/network/remote/dio_helper.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    const ProductsScreen(),
    const CategoriesScreen(),
    const FavoritesScreen(),
    SettingsScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel? homeModel;
  Map<int, bool> favorites = {};

  void getHomeData() {
    emit(ShopLoadingHomeDataState());

    DioHelperShop.getData(
      url: hOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      // printFullText(homeModel.data!.banners[0].image!);
      // print(homeModel!.status);
      for (var element in homeModel!.data!.products) {
        favorites.addAll({element.id!: element.inFavorites!});
      }
      // printFullText(
      //     'printFullText:homeModel.data!.banners![0].image!= ${homeModel.data!.banners![0].image!}');
      // printFullText(
      //     'printFullText:homeModel.status.toString()= ${homeModel.status.toString()}');
      // printFullText(
      //     'printFullText:homeModel.data!.banners![0].image!= ${homeModel.data!.banners![0].image!}');
      // printFullText(
      //     'printFullText:homeModel.data!.products![1].name= ${homeModel.data!.products![1].name}');
      // print(
      //     'print:homeModel.data!.banners![0].image!= ${homeModel.data!.banners![0].image!}');
      // print(
      //     'print:homeModel.status.toString()= ${homeModel.status.toString()}');
      // print(
      //     'print:homeModel.data!.banners![0].image!= ${homeModel.data!.banners![0].image!}');
      // print(
      //     'print:homeModel.data!.products![1].name= ${homeModel.data!.products![1].name}');
      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorHomeDataState());
    });
  }

  CategoriesModel? categoriesModel;
  void getCategories() {
    // emit(ShopLoadingHomeDataState());

    DioHelperShop.getData(
      url: gETcATEGORIES,
      // token: token,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(ShopSuccessCategoriesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorCategoriesState());
    });
  }

  ChangeFavoritesModel? changeFavoritesModel;
  void changeFavorites({required int productID}) {
    favorites[productID] = !favorites[productID]!;
    emit(ShopChangeFavoritesState());

    DioHelperShop.postData(
      url: fAVORITES,
      data: {'product_id': productID},
      token: token,
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);

      if (!changeFavoritesModel!.status!) {
        favorites[productID] = !favorites[productID]!;
      } else {
        getFavorites();
      }

      emit(ShopSuccessChangeFavoritesState(changeFavoritesModel!));
    }).catchError((error) {
      favorites[productID] = !favorites[productID]!;
      emit(ShopErrorChangeFavoritesState());
    });
  }

  FavoritesModel? favoritesModel;
  void getFavorites() {
    emit(ShopLoadingGetFavoritesState());

    DioHelperShop.getData(
      url: fAVORITES,
      token: token,
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      // printFullText(value.data.toString());
      emit(ShopSuccessGetFavoritesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorGetFavoritesState());
    });
  }

  ShopLoginModel? userModel;
  void getUserData() {
    emit(ShopLoadingUserDataState());

    DioHelperShop.getData(
      url: pROFILE,
      token: token,
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
      emit(ShopSuccessUserDataState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUserDataState());
    });
  }

  void updateUserData({
    required String name,
    required String email,
    required String phone,
  }) {
    emit(ShopLoadingUpdateUserState());

    DioHelperShop.putData(
      url: uPDATEpROFILE,
      token: token,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
      emit(ShopSuccessUpdateUserState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUpdateUserState());
    });
  }
}
