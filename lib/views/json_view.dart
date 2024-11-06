import 'dart:convert';
import 'package:shelf/shelf.dart';

class JsonView {

  static Response render(Map<String, dynamic> data) {
    return Response.ok(jsonEncode(data),
        headers: {'Content-Type': 'application/json'});
  }

  static Response renderError(String message,String error ,{int statusCode = 500}) {
    return Response(statusCode,
        body: jsonEncode({'message': message, 'error':error}),
        headers: {'Content-Type': 'application/json'});
  }
}