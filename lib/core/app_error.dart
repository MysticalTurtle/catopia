import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  const AppError({
    required this.title,
    required this.message,
    required this.statusCode,
  });
  factory AppError.empty() =>
      const AppError(title: '', message: '', statusCode: 0);

  final String title;
  final String message;
  final int statusCode;

  AppError copyWith({
    String? title,
    String? message,
    int? statusCode,
  }) =>
      AppError(
        title: title ?? this.title,
        message: message ?? this.message,
        statusCode: statusCode ?? this.statusCode,
      );

  @override
  List<Object?> get props => [
        title,
        message,
        statusCode,
      ];
}
