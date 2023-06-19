import 'dart:async';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url, this.jsonInput, this.token);
  var client = http.Client();

  final String url;
  final dynamic jsonInput;
  final String? token;
  final _storage = const FlutterSecureStorage();

  Future postForLogin() async {
    Map<String, String> headersGet = header();
    http.Response response;
    try {
      print(url);
      print(headersGet);
      print(jsonInput);

      if (jsonInput == null){
        response = await http.post(
          Uri.parse(url),
          headers: headersGet,
        );
      } else {
        response = await http.post(
          Uri.parse(url),
          headers: headersGet,
          body: jsonInput,
        );
      }

      var decodedData = jsonDecode(response.body);

      print('ResponseAPI : ${response.body}');


      return decodedData;
    } catch (e, s) {
      print(e);
      var response = {"status": 500, "message": e.toString(), "result": null};
      return response;
    }
  }

  Future postRequest() async {
    Map<String, String> headersGet = await standardHeader();

    try {
      print(url);
      print(jsonInput);

      http.Response response;
      response = await http.post(
        Uri.parse(url),
        headers: headersGet,
        body: jsonInput,
      );

      var decodedData = jsonDecode(response.body);

      print(decodedData);

      // client.close();
      return decodedData;
    } catch (e, s) {
      print(e);
      var response = {"status": 500, "message": e.toString(), "result": null};
      return response;
    }
  }

  Future getRequest() async {
    Map<String, String> headersGet = await standardHeader();

    try {
      print(url);
      // print("GET");
      // print(headersGet);

      http.Response responseGet;
      responseGet = await http.get(
        Uri.parse(url),
        headers: headersGet,
      );

      String data = responseGet.body;
      //var decodedData = json.decode(data);

      print("balikan response get $data");
      return data;
    } catch (e, s) {
      print(e);
      var response = {"status": 500, "message": e.toString(), "result": null};
      return response;
    }
  }

  Future deleteRequest() async {
    Map<String, String> headersGet = await standardHeader();

    try {
      print(url);
      // print("DELETE");
      // print(headersGet);

      http.Response responseget;
      responseget = await http.delete(
        Uri.parse(url),
        headers: headersGet,
      );

      String data = responseget.body;
      var decodedData = jsonDecode(data);
      print(responseget.body);
      return decodedData;
    } catch (e, s) {
      print(e);
      var response = {"status": 500, "message": e.toString(), "result": null};
      return response;
    }
  }

  Future<Map<String, String>> standardHeader() async {
    final data = await _storage.readAll();
    print(data);

    String tokens = data['apiToken'] ??
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImU3MTk1ZDczM2NjOGVmOTE5OGFlZjEyODU5YmIxZjRlNGRlNDkwMThlY2Q0ZGQ4YmRlNjNlNGEwOTc2MzI4NThhZWYwZTZlYmQ4M2M5YzUyIn0.eyJhdWQiOiIxIiwianRpIjoiZTcxOTVkNzMzY2M4ZWY5MTk4YWVmMTI4NTliYjFmNGU0ZGU0OTAxOGVjZDRkZDhiZGU2M2U0YTA5NzYzMjg1OGFlZjBlNmViZDgzYzljNTIiLCJpYXQiOjE2MjU1NDkxODgsIm5iZiI6MTYyNTU0OTE4OCwiZXhwIjoxNjU3MDg1MTg4LCJzdWIiOiIxMDAwMTIyMyIsInNjb3BlcyI6W119.jDH__9mX-zOhZUTn3Et_Wdyu2UfqOqgQ6-qG0goJLqy1ixJJheDC-dcPn8hyMT0CHyyIxPwTjTbviGDmKdpATRMBTIrdyCUEKIdusQB2mDp6Ip_eyOUPw_yDjtZZlCbQyqNWfHHND7jv5JvSJqeFZkIkUl6uvGQ2bkhPAaarNcGwMbGlgHIsF1ldqrQF7YrMg5lL0SwwD_oymJWLqmeKNDMe0TUmUiDjSMvbOejqlXc6YH2qjXfkdruIiOZxyn0pQvq6Qlt_0_8lHdcG7OlN2aBMS7ZcJ1cSnPnbSbxZpkhnXzykX7r1ulKG15VXf8WlUKBZ6n3K2ZIbwx-Ff0x-259ucKEvk_j5XJ55MgUns_jBN0oEJSZHnhCEeMEriuGXePEOWR96h89qdJz5upVpBxGFNvlzh13t1c5-5FKd8a-bGHcjsZxaNqV7HP7TZvRBwdf-PTNmBQn34jvRKSHVm4Rv7wEVfvN1Ji9gUWY5rJE-N4rG51JhZBw8ZJMf960XN0efdEPuxnAI3MYtDMaNLbswX6tMe2aLcpspiG_j3pXYZdoObUx7Yai5bTSplRR2a_Cv-1BkmExzcgl8ipeMLxmbRurBkI__1Sa-E8d-s4pFl-D6m09hcMW9iualvSQ4PmcI9LxERAgkdjuVe8es5Si0LMDzXlelXqd479Fe9Co";

    Map<String, String> headersGet = {
      'Content-Type': "application/json",
      'Accept': "application/json",
      'Authorization': "Bearer $tokens",
    };

    return headersGet;
  }

  Map<String, String> header() {
    Map<String, String> headersGet = {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    return headersGet;
  }
}
