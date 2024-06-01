import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../error/failures.dart';
import 'api_interceptor.dart';
import 'api_paths.dart';

typedef ResponseConverter<T> = T Function(dynamic response);

class ApiClient {
  late Future<String?> _accessToken;
  late Future<Dio> _dio;

  ApiClient() {
    _dio = _createDio();
  }

  Future<Dio> _createDio() async {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiPaths.baseUrl,
        // headers: {
        //   'Content-Type': 'application/json',
        //   'Accept': 'application/json',
        //   if ((await _accessToken) != null) ...{
        //     'Authorization': "Bearer ${await _accessToken}",
        //   },
        // },
        receiveTimeout: const Duration(minutes: 1),
        connectTimeout: const Duration(minutes: 1),
        validateStatus: (int? status) {
          return status! > 0;
        },
      ),
    );
    dio.interceptors.add(ApiInterceptor());
    return dio;
  }

  Future<Dio> get dio async {
    final dio = await _createDio();
    return dio;
  }

  Future<Either<Failure, T>> getRequest<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    required ResponseConverter<T> converter,
    String? requestName,
  }) async {
    try {
      final response =
          await (await dio).get(url, queryParameters: queryParameters);
      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 201) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }

      return Right(converter(response.data));
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return Left(UnauthorizedFailure());
      } else {
        return Left(
          ServerFailure(
            message: e.response?.data['message'] as String? ?? e.message,
          ),
        );
      }
    }
  }

  Future<Either<Failure, T>> postRequest<T>(String url,
      {Map<String, dynamic>? data,
      FormData? formData,
      required ResponseConverter<T> converter,
      String? requestName}) async {
    try {
      final response = await (await dio).post(url, data: data ?? formData);
      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 201) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
      return Right(converter(response.data));
    } on DioException catch (e) {
      if (e.response?.statusCode == 422 &&
          e.response != null &&
          (e.response!.data as Map).containsKey("meta")) {
        if (((e.response!.data as Map)["meta"] as List).isNotEmpty) {
          List validationErrors =
              ((e.response!.data as Map)["meta"][0] as Map).entries.toList();
          if (validationErrors.isNotEmpty) {
            return Left(ValidationFailure(
                message:
                    (validationErrors.first as MapEntry).value[0].toString()));
          }
        }
      } else if (e.response?.statusCode == 401) {
        return Left(UnauthorizedFailure());
      }
      return Left(
        ServerFailure(
          message: e.response?.data['message'] as String? ?? e.message,
        ),
      );
    }
  }
}
