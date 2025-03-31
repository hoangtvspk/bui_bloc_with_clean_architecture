import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  static DioClient? _instance;
  final Dio _dio;
  String? _accessToken;
  String? _refreshToken;

  // Private constructor
  DioClient._internal(this._dio) {
    setupInterceptors();
  }

  // Factory constructor to return the same instance
  factory DioClient() {
    _instance ??= DioClient._internal(
      Dio(
        BaseOptions(
          baseUrl: 'YOUR_BASE_URL', // Replace with your API base URL
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          sendTimeout: const Duration(seconds: 30),
        ),
      ),
    );
    return _instance!;
  }

  // Methods to update tokens
  void setTokens({String? accessToken, String? refreshToken}) {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
  }

  void resetTokens() {
    _accessToken = null;
    _refreshToken = null;
  }

  void setupInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (_accessToken != null) {
            options.headers['Authorization'] = 'Bearer $_accessToken';
          }
          options.headers['Content-Type'] = 'application/json';
          options.headers['Accept'] = 'application/json';
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401) {
            // Token expired or invalid
            if (_refreshToken != null) {
              try {
                // Store the failed request
                final RequestOptions requestOptions = error.requestOptions;

                // Try to refresh the token
                final response = await _dio.post(
                  '/refresh-token', // Your refresh token endpoint
                  data: {
                    'refresh_token': _refreshToken,
                  },
                );

                if (response.statusCode == 200) {
                  // Update tokens
                  final newAccessToken = response.data['access_token'];
                  final newRefreshToken = response.data['refresh_token'];
                  setTokens(
                    accessToken: newAccessToken,
                    refreshToken: newRefreshToken,
                  );

                  // Retry the original request with new token
                  final opts = Options(
                    method: requestOptions.method,
                    headers: {
                      'Authorization': 'Bearer $newAccessToken',
                      ...requestOptions.headers,
                    },
                  );

                  final retryResponse = await _dio.request(
                    requestOptions.path,
                    options: opts,
                    data: requestOptions.data,
                    queryParameters: requestOptions.queryParameters,
                  );

                  return handler.resolve(retryResponse);
                }
              } catch (e) {
                // Refresh token failed - user needs to login again
                resetTokens();
                // You might want to notify your auth state management here
                // e.g., BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
              }
            }
          }

          switch (error.response?.statusCode) {
            case 403:
              // Handle forbidden
              break;
            case 404:
              // Handle not found
              break;
            case 500:
              // Handle server error
              break;
          }
          return handler.next(error);
        },
      ),
    );

    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
      ));
    }
  }

  // Expose Dio methods
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response> put(String path, {dynamic data}) async {
    return await _dio.put(path, data: data);
  }

  Future<Response> delete(String path, {dynamic data}) async {
    return await _dio.delete(path, data: data);
  }

  Future<Response> patch(String path, {dynamic data}) async {
    return await _dio.patch(path, data: data);
  }
}
