import 'dart:convert';
import 'dart:io';
import 'package:flu_cubit_bloc/flu_cubit_bloc/ibb_data.dart';
import 'package:http/http.dart' as http;
abstract class DataRepos {
  Future <List<IBBData>> getIBBData();
}

class IbbDataRepos implements DataRepos{
  final baseUrl="https://data.ibb.gov.tr/dataset/bd3b9489-c7d5-4ff3-897c-8667f57c70bb/resource/6800ea2d-371b-4b90-9cf1-994a467145fd/download/salk-kurum-ve-kurulularna-ait-bilgiler.json";
  @override
  Future<List<IBBData>> getIBBData() async {
    final response=await http.get(baseUrl);
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody=jsonDecode(response.body) as List;
      return jsonBody.map((e) => IBBData.fromJson(e)).toList();
    } else {
      throw NetworkError(response.statusCode.toString(), response.body);
    }
  }
  
}

class NetworkError implements Exception {
  final String statusCode;
  final String message;

  NetworkError(this.statusCode, this.message);
}