class UserModel {
  String? name;
  String? imageProfile;
  UserModel({required this.name, this.imageProfile = ''});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageProfile = json['imageProfile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['imageProfile'] = imageProfile;
    return data;
  }
}
