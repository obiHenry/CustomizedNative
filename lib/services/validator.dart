class Validators {
  static String email(String value) {
    if (value.isEmpty) {
      return 'Please enter a valid email address';
    }
    if (!value.contains('@')) {
      return 'Email is invalid, must contain @';
    }
    if (!value.contains('.')) {
      return 'Email is invalid, must contain .';
    }
    return 'input okay';
  }

  static String password(String value) {
    if (value.isEmpty) {
      return 'Please enter your Password';
    }
    if (value.length < 8) {
      return 'Password must be more than 8 characters';
    }
    return 'input okay';
  }
}
