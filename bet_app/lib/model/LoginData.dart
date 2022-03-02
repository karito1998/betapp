/**
 * usado para guardar infomacion de login
 */
class LoginData {
  String token = "";
  String email = "";
  bool loginAuth = false;

  void setEmail(String email) {
    this.email = email;
  }

  String getEmail() {
    return email;
  }

  void setToken(String token) {
    this.token = token;
  }

  String getToken() {
    return token;
  }

  bool getLoginAuth() {
    return loginAuth;
  }

  void setLoginAuth(bool loginAuth) {
    this.loginAuth = loginAuth;
  }
}
