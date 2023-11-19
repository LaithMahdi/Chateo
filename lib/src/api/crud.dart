import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../core/enum/statusRequest.dart';

class Crud {
  Dio dio = Dio();
  Future<Either<StatusRequest, Map>> postDataImage(
      String linkurl, FormData formData) async {
    try {
      final response = await dio.post(
        linkurl,
        options: Options(
          headers: {'Content-Type': 'multipart/form-data'},
        ),
        data: formData,
      );

      print("POST Method ----- ${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        dynamic responsebody = response.data;
        print("Response Body: $responsebody");
        return Right(responsebody);
      } else if (response.statusCode == 400) {
        Map<String, dynamic> responsebody = response.data;
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.failed);
      }
    } catch (error) {
      print("Error: $error");
      return const Left(StatusRequest.failed);
    }
  }

  Future<Either<StatusRequest, Map>> postData(
      String linkurl, dynamic data) async {
    try {
      final response = await dio.post(
        linkurl,
        options: Options(headers: {'Content-Type': 'application/json'}),
        data: jsonEncode(data),
      );

      print("POST Method ----- ${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        dynamic responsebody = response.data;
        print("Response Body: $responsebody");
        return Right(responsebody);
      } else if (response.statusCode == 400) {
        Map<String, dynamic> responsebody = response.data;
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.failed);
      }
    } catch (error) {
      print("Error: $error");
      return const Left(StatusRequest.failed);
    }
  }

  Future<Either<StatusRequest, Map>> fetchData(
      String linkurl, String? authToken) async {
    try {
      dio.options.headers = {
        'Content-Type': 'application/json',
        'Authorization': 'token $authToken',
      };

      final response = await dio.get(linkurl);

      print("GET Method ----- ${response.statusCode}");

      if (response.statusCode == 200) {
        dynamic responsebody = response.data;
        print("Response Body: $responsebody");
        return Right(responsebody);
      } else if (response.statusCode == 401) {
        return const Left(StatusRequest.unauthorized);
      } else {
        return const Left(StatusRequest.failed);
      }
    } catch (error) {
      print("Error: $error");
      return const Left(StatusRequest.failed);
    }
  }
}
