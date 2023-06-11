class UserModel{
  String id;
  String name;
  String email;
  String fcmToken;

  UserModel({required this.name,required this.id,required this.email, required this.fcmToken});

  Map<String, dynamic> toJson(){
    return{
      "id": id,
      "name": name,
      "email": email,
      "fcmToken": fcmToken
    };
  }

  static UserModel fromMap(Map<String,dynamic> map){

    return UserModel(
      id: map["id"],
      name: map["name"],
      email: map["email"],
      fcmToken: map["fcmToken"] ?? ""
    );
  }

}