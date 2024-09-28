// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OperationException {
  final int statusCode;
  final String? title;
  final String? description;

  OperationException({
    required this.statusCode,
    this.title,
    this.description,
  });

  static OperationException general = OperationException(
    statusCode: 500,
    title: 'General Exception',
    description: 'General Exception Description',
  );

  OperationException copyWith({
    int? statusCode,
    String? title,
    String? description,
  }) {
    return OperationException(
      statusCode: statusCode ?? this.statusCode,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'statusCode': statusCode,
      'title': title,
      'description': description,
    };
  }

  factory OperationException.fromMap(Map<String, dynamic> map) {
    return OperationException(
      statusCode: map['statusCode'] as int,
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OperationException.fromJson(String source) =>
      OperationException.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'OperationException(statusCode: $statusCode, '
      'title: $title, description: $description)';
}
