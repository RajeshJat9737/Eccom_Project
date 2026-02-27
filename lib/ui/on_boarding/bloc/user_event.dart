abstract class UserEvent {}

class UserRegisterEvent extends UserEvent {
  String name, email, mobileNo, password;

  UserRegisterEvent({
    required this.name,
    required this.email,
    required this.mobileNo,
    required this.password,
  });
}

class UserLoginEvent extends UserEvent {
  String email, password;
  UserLoginEvent({
    required this.email,
    required this.password,
  });
}
