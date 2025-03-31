import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

@Freezed(genericArgumentFactories: true)
class BaseResponse<T> with _$BaseResponse<T> {
  const factory BaseResponse({
    @Default(false) bool success,
    @Default('') String message,
    T? data,
    @Default([]) List<String> errors,
  }) = _BaseResponse;

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseResponseFromJson(json, fromJsonT);
}
