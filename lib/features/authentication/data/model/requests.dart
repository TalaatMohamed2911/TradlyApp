class LoginRequest {
  String email;
  String password;

  LoginRequest(this.email, this.password);
}

class RegisterRequest {
  String firstName;
  String lastName;
  String email;
  String password;

  RegisterRequest(this.firstName, this.lastName, this.email, this.password);
}
