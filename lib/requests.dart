import 'dart:convert';
import 'package:http/http.dart' as http;

var _client = http.Client();
Map<String, String> headers = {
  "Content-type": 'application/json',
  'Accept': 'application/json',
};

logIn(Map<String, dynamic> data) async {
  try {
    return await _client.post(
      'https://cheerup-back.herokuapp.com/login',
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );
  } catch (err) {
    return err;
  }
}

signIn(Map<String, dynamic> data) async {
  try {
    return await _client.post(
      'https://cheerup-back.herokuapp.com/signin',
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );
  } catch (err) {
    print(err);
    return err;
  }
}
