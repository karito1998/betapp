/**
 * usado para guardar infomacion de login
 */
class LoginData {
  String merchantCode = "";
  String operatorCode = "";
  String operatorPin = "";
  String rol = "";
  String token = "";
  String message = "";
  String email = "";

  String getMerchantCode() {
    return merchantCode;
  }

  void setMerchantCode(String merchantCode) {
    this.merchantCode = merchantCode;
  }

  void setEmail(String email) {
    this.email = email;
  }

  String getOperatorCode() {
    return operatorCode;
  }

  void setOperatorCode(String operatorCode) {
    this.operatorCode = operatorCode;
  }

  String getOperatorPin() {
    return operatorPin;
  }

  void setOperatorPin(String operatorPin) {
    this.operatorPin = operatorPin;
  }

  String getRol() {
    return rol;
  }

  void setRol(String rol) {
    this.rol = rol;
  }

  String getToken() {
    return token;
  }

  void setToken(String token) {
    this.token = token;
  }

  String getMessage() {
    return message;
  }

  void setMessage(String message) {
    this.message = message;
  }
}
