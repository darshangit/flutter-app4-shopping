import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  Future<void> signup(String email, String password) async {
    const url =
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBJH8u1Cd1v7M_i8x1RiF-v_HEZW-edvbM";
    final response = await http.post(url,
        body: jsonEncode(
            {"email": email, "password": password, "returnSecureToken": true}));

    print(jsonDecode(response.body));
  }
}
