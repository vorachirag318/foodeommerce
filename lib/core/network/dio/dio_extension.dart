import 'dart:io';
import 'package:dio/dio.dart';
import 'package:gharoghari/core/network/utils/base_response.dart';
import 'package:http_parser/http_parser.dart';

extension DioEx on Dio {
  /// Top level methods
  ///
  /// common GET method
  Future<ApiResponse> getApi(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      Response response = await get(
        path,
        queryParameters: queryParameters,
      );
      return _getResponse(response);
    } on DioError catch (e) {
      throw _getError(e);
    }
  }

  ///common MULTIPART POST method
  Future<ApiResponse> postMultipartApi(String path,
      {FormData? formData,
      void Function(int, int)? onSendProgress,
      Options? options}) async {
    try {
      Response response = await post(
        path,
        options: options,
        data: formData,
        onSendProgress: onSendProgress,
      );
      return _getResponse(response);
    } on DioError catch (e) {
      throw _getError(e);
    }
  }

  ///common MULTIPART POST method
  Future<ApiResponse> putMultipartApi(String path, {FormData? formData}) async {
    try {
      Response response = await put(
        path,
        data: formData,
      );
      return _getResponse(response);
    } on DioError catch (e) {
      throw _getError(e);
    }
  }

  /// Common POST method
  Future<ApiResponse> postApi(
    String path, {
    dynamic map,
  }) async {
    try {
      Response response = await post(
        path,
        data: map,
      );
      return _getResponse(response);
    } on DioError catch (e) {
      throw _getError(e);
    }
  }

  // Future<ApiResponse<bool>> downloadFile(
  //     {required String url, required String id, required bool isImage}) async {
  //   try {
  //     cancelToken = CancelToken();
  //
  //     bool isSuccessfullyDownloaded = false;
  //     final path = await getExternalStorageDirectory();
  //     String newPath = path!.path + "/" + id + (isImage ? ".jpg" : ".mp4");
  //     await Dio().download(
  //       url,
  //       cancelToken: cancelToken,
  //       newPath,
  //       onReceiveProgress: (count, total) async {
  //         if (count / total == 1.0) {
  //           isSuccessfullyDownloaded = true;
  //         }
  //         appController
  //             .addVideoDownloadProgress(VideoDownloadProgress(count, total));
  //       },
  //     );
  //     if (isSuccessfullyDownloaded) {
  //       if (isImage) {
  //         await GallerySaver.saveImage(newPath,
  //             albumName: AppSettings.albumName)
  //             .then((value) {
  //           File(newPath).deleteSync();
  //         });
  //       } else {
  //         await GallerySaver.saveVideo(newPath,
  //             albumName: AppSettings.albumName)
  //             .then((value) {
  //           File(newPath).deleteSync();
  //         });
  //       }
  //     }
  //     return ApiResponse(isSuccessfullyDownloaded);
  //   } on DioError {
  //     rethrow;
  //   }
  // }

  ApiResponse _getResponse(Response response) {
    final rawResponse = RawResponse.fromJson(response.data);
    if (rawResponse.isSuccess) {
      return ApiResponse(rawResponse.data);
    }
    throw _getErrorFromRawError(rawResponse.error);
  }

  ApiError _getErrorFromRawError(RawError? error) {
    return ApiError(
      ErrorType.apiFailure,
      code: error?.code ?? "UNKNOWN_ERROR",
      message: error?.msg ?? "Unknown error",
    );
  }

  ApiError _getError(DioError e) {
    switch (e.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return ApiError(ErrorType.timeout);
      case DioErrorType.response: //401, 404, 403
        final response = RawResponse.fromJson(e.response?.data);
        return _getErrorFromRawError(response.error);
      case DioErrorType.other:
        if (e.error is HttpException) {
          return ApiError(ErrorType.noConnection);
        }
        return ApiError(ErrorType.unknown);
      default:
        return ApiError(ErrorType.unknown);
    }
  }
}

extension FileEx on File {
  MultipartFile getMultipartFromFile(String mediaType, String extension) {
    return MultipartFile.fromFileSync(
      path,
      filename: '${DateTime.now().millisecondsSinceEpoch}.$extension',
      contentType: MediaType(mediaType, extension),
    );
  }
}
