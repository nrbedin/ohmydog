import 'package:dio/dio.dart';
import 'package:ohmydog/app/core/helpers/constants.dart';
import 'package:ohmydog/app/core/local_storage/local_storage.dart';
import 'package:ohmydog/app/core/logger/app_logger.dart';

class AuthInterceptor extends Interceptor {
  LocalStorage _localStorage;
  AppLogger _log;

  AuthInterceptor({
    required LocalStorage localStorage,
    required AppLogger log,
  })  : _localStorage = localStorage,
        _log = log;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final authRequired =
        options.extra[Constants.REST_CLIENT_AUTH_REQUEST_KEY] ?? false;

    if (authRequired) {
      final accessToken =
          await _localStorage.read(Constants.LOCAL_STORAGE_ACCESS_TOKEN_KEY);

      if (accessToken == null) {
        return handler.reject(
          DioError(
            requestOptions: options,
            error: 'Expire Token',
            type: DioErrorType.cancel,
          ),
        );
      }

      options.headers['Authorization'] = accessToken;
    }else{
      options.headers.remove('Authorization');
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }
}
