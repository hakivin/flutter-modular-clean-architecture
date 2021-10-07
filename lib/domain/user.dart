class User {
  String? token;
  String? name;
  bool isLoggedIn;

  User({
    this.token,
    this.name,
    this.isLoggedIn = false,
  });
}