class UserModel {
  int id;
  String name;
  String email;
  String website;

  UserModel(int id, String name, String email, String website){
    this.id = id;
    this.name = name;
    this.email = email;
    this.website = website;
  }

  UserModel.fromjson(Map json) : id = json["id"], name = json["name"], email = json["email"], website = json["website"];

  Map toJson(){
    return {
      'id': id,
      'name': name,
      'email': email,
      'website' : website
      };
  }


}