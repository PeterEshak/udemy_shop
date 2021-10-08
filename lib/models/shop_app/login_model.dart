class ShopLoginModel {
  bool? status;
  String? message;
  UserData? data;

  ShopLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null!;
  }

  
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  // UserData({
  //   required this.id,
  //   required this.name,
  //   required this.email,
  //   required this.phone,
  //   required this.image,
  //   required this.points,
  //   required this.credit,
  //   required this.token,
  // });

  // named constructor

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id']?? 0;
    name = json['name']??'';
    email = json['email']??'';
    phone = json['phone']??'';
    image = json['image']??'';
    points = json['points']??0;
    credit = json['credit']??0;
    token = json['token']??'';
  }
}
