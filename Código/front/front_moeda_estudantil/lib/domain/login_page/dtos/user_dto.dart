class UserDTO {
  String? name;
  String? email;
  UserTypeEnum? type;

  UserDTO({
    this.name,
    this.email,
    this.type
  });
}

enum UserTypeEnum {
  professor,
  student
}