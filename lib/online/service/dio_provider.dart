import 'package:auto_mafia/online/data/endpoints.dart';
import 'package:auto_mafia/online/data/models/responses/errors.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  return Dio(BaseOptions(
    baseUrl: Endpoints.http + Endpoints.host + Endpoints.port + Endpoints.apiV1,
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
    headers: {
      "Accept-Language": "fa",
    },
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 5),

    receiveDataWhenStatusError: true,
    // persistentConnection: false,
  ))
    ..interceptors.add(
      InterceptorsWrapper(onRequest: (options, handler) {
        // Do something before request is sent
        print('request path : ' + options.path);
        return handler.next(options); //continue
      }, onResponse: (response, handler) {
        // Do something with response data
        print('response path : ' + response.requestOptions.path);
        return handler.next(response); // continue
      }, onError: (DioException e, handler) async {
        // Do something with response error
        print('error path : ' + e.requestOptions.path);
        if (e.response != null) {
          // Handle the error response from the server
          print('error response : ' + e.response!.data.toString());
          return handler.resolve(
            Response(
              requestOptions: e.requestOptions,
              data: e.response!.data,
              statusCode: e.response!.statusCode,
              statusMessage: e.response!.statusMessage,
              headers: e.response!.headers,
            ),
          );
        } else {
          // Handle the timeout error
          print('error connectTimeout : ');
          return handler.resolve(
            Response(
              requestOptions: e.requestOptions,
              data: <String, dynamic>{
                'msg': 'اتصال به سرور برقرار نشد',
              },
              statusCode: 408,
              statusMessage: 'Connection Timeout',
            ),
          );
        }
      }),
    );
}
