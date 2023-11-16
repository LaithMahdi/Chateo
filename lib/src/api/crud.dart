import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../core/enum/statusRequest.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      final response = await http.post(
        Uri.parse(linkurl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );
      print("POST Method ----- ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        dynamic responsebody = jsonDecode(response.body);
        print("Response Body: $responsebody");
        return Right(responsebody);
      } else if (response.statusCode == 400) {
        Map<String, dynamic> responsebody = jsonDecode(response.body);
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.failed);
      }
    } catch (error) {
      print("Error: $error");
      return const Left(StatusRequest.failed);
    }
  }
}
