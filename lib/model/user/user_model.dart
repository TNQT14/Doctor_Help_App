class UserModel{
  String? name;
  String? email;
  String? password;
  int? phone;
  String? address;
  String? birthday;
  String?  imageUrl;

  UserModel({
     this.password,
     this.email,
     this.name,
     this.imageUrl,
     this.phone,
     this.address,
     this.birthday,
});
}