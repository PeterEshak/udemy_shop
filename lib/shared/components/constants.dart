// POST
// UPDATE
// DELETE

// GET

// base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// queries : country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca

// https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca

// https://newsapi.org/v2/everything?q=test&apiKey=65f7f556ec76449fa7dc7c0069f040ca

// Register 
// name: Abdullah mansour Ali
// email: abullah@gmail.com
// password: 123456
// phone: 789456123

import 'package:shop/modules/shop_app/login/shop_login_screen.dart';
import 'package:shop/shared/network/local/cache_helper.dart';

import 'components.dart';

void signOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      navigateAndFinish(context, ShopLoginScreen());
    }
  });
}

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String token = '';
