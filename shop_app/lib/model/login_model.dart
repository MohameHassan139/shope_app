class LoginInfo {
  late bool status;
  late String message;
  late UserData? data;

  LoginInfo.fromjson(Map<String, dynamic> json) {
    this.status = json['status'];
    this.message = json['message'];
     data=json['data'] == null?null: UserData.fromjson(json['data']);
  }
}

class UserData {
  late int id;
  late String name;
  late String email;
  late String phone;
  late String image;
  late int points;
  late int credit;
  late String token;

  UserData.fromjson(Map<String, dynamic> json){
    this.id = json['id'];
    this.name = json['name'];
    this.email = json['email'];
    this.phone = json['phone'];
    this.image = json['image'];
    this.points = json['points'];
    this.credit = json['credit'];
    this.token = json['token'];
  }


}
