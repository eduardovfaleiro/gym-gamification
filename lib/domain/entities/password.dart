class Password {
  final String value;

  Password(this.value);

  bool isValid() {
    if (value != '123') return false;
    return true;
  }
}
