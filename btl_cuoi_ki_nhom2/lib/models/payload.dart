class LoginPayload {
  String email;
  String password;

  LoginPayload(this.email, this.password);
}

class RegisterPayload {
  String email;
  String password;
  String resPassword;

  RegisterPayload(this.email, this.password, this.resPassword);
}

