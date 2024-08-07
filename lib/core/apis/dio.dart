import 'dart:io';

import 'package:dio/dio.dart';


class DioHelper {
  static Dio? dio ;
  static init (){
    dio = Dio(
        BaseOptions(
          baseUrl: 'http://10.1.1.31:8000/api',
          receiveDataWhenStatusError: true,
        )
    );
  }
  static Future<Response> getData({required String? url , Map<String,dynamic>? query , String? lang=' en ',String? token})
  async{
    dio!.options.headers={
      'lang':lang,
      'Authorization':token??'',
      'content-type':'multipart/form-data; boundary=<calculated when request is sent>'
    };
    return await dio!.get
      (
        url!,
        queryParameters: query
    );
  }
  static Future<Response> postData({required String? url, Map<String,dynamic>? query,required Map<String,dynamic> data,String? lang= 'en',String? token })
  async{
    dio!.options.headers={
      'lang':lang,
      'Authorization':token??'',
      // 'content-type':'multipart/form-data; boundary=<calculated when request is sent>',
      'Accept':'application/json'
    };
    return await dio!.post(
        url!,
        queryParameters: query,
        data:data
    );
  }
  static Future<Response> delete({required String? url, Map<String,dynamic>? query, required Map<String,dynamic> data , String? lang = 'en',String? token })
  async{
    dio!.options.headers={
      'lang':lang,
      'Authorization':token??'',
      'content-type':'application/json'
    };
    return await dio!.delete
      (
        url!,
        queryParameters: query,
        data: data
    );
  }
}