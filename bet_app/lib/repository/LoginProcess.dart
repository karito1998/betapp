import 'dart:convert';
import 'package:bet_app/model/LoginData.dart';
import 'package:http/http.dart' as http;

/**
 * Peticion de login de la app y login de keycloak
 */

Future<LoginData> LoginProcess(String user, String password) async {
  LoginData loginDataModel = new LoginData();
  try {
    //login oauth
    var url = Uri.parse('http://localhost:8090/oauth/token');
    var response = await http.post(url, headers: {
      'Authorization': 'Basic Y3Vwb19jbGllbnQ6Y3Vwb19zZWNyZXQ=',
      'Content-Type': 'application/x-www-form-urlencoded'
    }, body: {
      "client_id": "cupo_client",
      "client_secret": "cupo_secret",
      "grant_type": "password",
      "username": "karol",
      "password": "1234",
    });
    // if (response.statusCode == 200) {
    final token = jsonDecode(response.body);
    print(token['body']);
    /*    //print(loginData['body']);
          if (loginData["header"]["codigoError"] == null) {
            loginDataModel.setEmail(user);
            loginDataModel.setMerchantCode(loginData['body']['merchantCode']);
            loginDataModel.setOperatorCode(loginData['body']['operatorCode']);
            loginDataModel.setOperatorPin(loginData['body']['pin']);
            loginDataModel.setRol(loginData['body']['rol']);
            loginDataModel.setToken(token['body']);
          }
        } else {
          loginDataModel.setMessage("Invalid Login");
        }
      */
  } catch (e, s) {
    print("Exception $e");
    print("StackTrace $s");
    print("fail login");
  }

  return loginDataModel;
}
