import 'dart:convert';
import 'package:bet_app/model/LoginData.dart';
import 'package:http/http.dart' as http;

/**
 * Peticion de login de la app 
 */

Future<LoginData> LoginProcess(String user, String password) async {
  LoginData loginDataModel = new LoginData();
  print("Login process");
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
      "username": user,
      "password": password,
    });
    final token = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print("Login Succesful");
      loginDataModel.setToken(token['access_token']);
      loginDataModel.setEmail(user);
      loginDataModel.setLoginAuth(true);
    } else {
      print(token['error']);
      loginDataModel.setEmail(user);
      loginDataModel.setLoginAuth(false);
    }
  } catch (e, s) {
    print("Exception $e");
    print("StackTrace $s");
    print("fail login");
  }

  return loginDataModel;
}
