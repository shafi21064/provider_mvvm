import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:model_mvvm/data/app_exception.dart';
import 'package:model_mvvm/data/network/base_api_services.dart';

class NetworkApiResponse extends BaseApiServices{

  @override
  Future getGetApiResponse(String url) async{
    dynamic responseJson;
    try{
      final response = await http.get(Uri.parse(url));
      responseJson = returnResponse(response);

    }on SocketException{
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async{
    dynamic responseJson;
    try{
      Response response = await post(
          Uri.parse(url),
          body: data);
      responseJson = returnResponse(response);

    }on SocketException{
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(response.body.toString());
      case 404:
        throw UnAuthorizedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException('Error occurred while communication with server with '
            'status code: ${response.statusCode}');
    }
  }
  
}