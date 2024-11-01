
import 'package:dio/dio.dart';
import 'package:ohmydog/app/core/helpers/constants.dart';
import 'package:ohmydog/app/core/helpers/environments.dart';
import 'package:ohmydog/app/core/local_storage/local_storage.dart';
import 'package:ohmydog/app/core/logger/app_logger.dart';
import 'package:ohmydog/app/core/rest_client/dio/interceptors/auth_interceptor.dart';
import 'package:ohmydog/app/core/rest_client/rest_client.dart';
import 'package:ohmydog/app/core/rest_client/rest_client_exception.dart';
import 'package:ohmydog/app/core/rest_client/rest_client_response.dart';

class DioRestClient implements RestClient {

  late final Dio _dio;
  final _defaultOptions = BaseOptions(
    baseUrl: Environments.param(Constants.ENV_BASE_URL_KEY) ?? '',
    connectTimeout: int.parse(Environments.param(Constants.REST_CLIENT_CONNECT_TIMEOUT_KEY ) ?? '0'),
    receiveTimeout: int.parse(Environments.param(Constants.REST_CLIENT_RECEIVE_TIMEOUT_KEY) ??  '0'),
  );

  DioRestClient({
    required LocalStorage localStorage,
    required AppLogger log,
    BaseOptions? baseOptions,
  }){
    _dio = Dio(baseOptions ?? _defaultOptions);
    _dio.interceptors.addAll([
      LogInterceptor(requestBody: true, responseBody: true),
      AuthInterceptor(localStorage: localStorage, log: log)
    ]);
  }
  @override
  RestClient auth() {
    _defaultOptions.extra[Constants.REST_CLIENT_AUTH_REQUEST_KEY] = true;
    return this;
  }

  @override
  RestClient unauth() {
    _defaultOptions.extra[Constants.REST_CLIENT_AUTH_REQUEST_KEY] = false;
    return this;
  }

  @override
  Future<RestClientResponse<T>> delete<T>(String path,
   {data, Map<String, dynamic>? queryParameters, 
   Map<String, dynamic>? headers}) async{
  try {
  final response = await _dio.delete(
    path,
    data: data,
    queryParameters: queryParameters,
    options: Options(headers: headers),
    );
    return  _dioResponseConverter(response);
} on DioError catch (e) {
 _throwRestClientExpection(e);
}
  }

  @override
  Future<RestClientResponse<T>> get<T>
  (String path, 
  {Map<String, dynamic>? queryParameters,
  Map<String, dynamic>? headers}) async{
  try {
  final response = await _dio.get(
    path,

    queryParameters: queryParameters,
    options: Options(headers: headers),
    );
    return  _dioResponseConverter(response);
} on DioError catch (e) {
 _throwRestClientExpection(e);
}
  }

  @override
  Future<RestClientResponse<T>> patch<T>(
    String path, {
    required String method, data, 
    Map<String, dynamic>? queryParameters, 
    Map<String, dynamic>? headers})async {
     try {
  final response = await _dio.patch(
    path,
    data: data,
    queryParameters: queryParameters,
    options: Options(headers: headers),
    );
    return  _dioResponseConverter(response);
} on DioError catch (e) {
 _throwRestClientExpection(e);
}
  }

  @override
  Future<RestClientResponse<T>> post<T>(
    String path, {
      data, 
    Map<String, dynamic>? queryParameters, 
    Map<String, dynamic>? headers}) async{
  try {
  final response = await _dio.post(
    path,
    data: data,
    queryParameters: queryParameters,
    options: Options(headers: headers),
    );
    return  _dioResponseConverter(response);
} on DioError catch (e) {
 _throwRestClientExpection(e);
}
  }

  @override
  Future<RestClientResponse<T>> put<T>(
    String path, {
      data, Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async{
  try {
  final response = await _dio.put(
    path,
    data: data,
    queryParameters: queryParameters,
    options: Options(headers: headers),
    );
    return  _dioResponseConverter(response);
} on DioError catch (e) {
 _throwRestClientExpection(e);
}
  }

  @override
  Future<RestClientResponse<T>> request<T>(
    String path, {
      required String method, data, 
      Map<String, dynamic>? queryParameters, 
      Map<String, dynamic>? headers})async {
  try {
  final response = await _dio.request(
    path,
    data: data,
    queryParameters: queryParameters,
    options: Options(headers: headers, method: method),
    );
    return  _dioResponseConverter(response);
} on DioError catch (e) {
 _throwRestClientExpection(e);
}
  }


Future<RestClientResponse<T>> _dioResponseConverter<T>(
  Response<dynamic> response) async{
    return RestClientResponse<T>(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
}

 Never _throwRestClientExpection(DioError dioError){
  final response = dioError.response;
    throw RestClientException(
    error: dioError.error, 
    message: response?.statusMessage,
    statusCode: response?.statusCode,
    response: RestClientResponse(
      data: response?.data,
      statusCode: response?.statusCode,
      statusMessage: response?.statusMessage,
    ));
}
  
}