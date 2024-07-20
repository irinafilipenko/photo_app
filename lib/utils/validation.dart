class Validation {
  static bool validateEmail(String email) {
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.!#$%&\'*+\/=?^_`{|}~-]{1,10}@(?:(?!.*--)[a-zA-Z0-9-]{1,10}(?<!-))(?:\.(?:[a-zA-Z0-9-]{2,10}))+");
    return email.length >= 6 &&
        email.length <= 30 &&
        emailRegex.hasMatch(email);
  }

  static bool validatePassword(String password) {
    final passwordRegex =
        RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,10}$');
    return password.length >= 6 &&
        password.length <= 10 &&
        passwordRegex.hasMatch(password);
  }
}
