bool isEmailValidChecker(String email) {
  return RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_'{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  ).hasMatch(email);
}

bool isPasswordValid(String password) {
  return password.length >= 6;
}

bool isNameValid(String name) {
  return name.length >= 5;
}
