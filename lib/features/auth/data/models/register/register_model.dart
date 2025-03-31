import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_model.freezed.dart';
part 'register_model.g.dart';

@freezed
class RegisterModel with _$RegisterModel {
  const factory RegisterModel({
    required String email,
    required String phoneNumber,
    String? fullName,
    String? address,
    DateTime? dateOfBirth,
  }) = _RegisterModel;

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);
}
