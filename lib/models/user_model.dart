class UserModel {
  dynamic phoneNumber;
  dynamic age;
  dynamic userID;
  dynamic displayName;
  dynamic email;
  dynamic imageUrl;

  UserModel({
    required this.userID,
    required this.displayName,
    required this.email,
    required this.phoneNumber,
    required this.age,
    required this.imageUrl,
  });

  factory UserModel.fromDocument(var data) {
    return UserModel(
        userID: data['id'],
        email: data['email'],
        displayName: data['displayName'],
        imageUrl: data['imageUrl'],
        phoneNumber: data['phoneNumber'],
        age: data['age']);
  }
}
