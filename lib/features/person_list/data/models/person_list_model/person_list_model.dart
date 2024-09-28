import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'person_list_datum.dart';

class PersonListModel extends Equatable {
  final String? status;
  final int? code;
  final String? locale;
  final dynamic seed;
  final int? total;
  final List<PersonListDatum>? data;

  const PersonListModel({
    this.status,
    this.code,
    this.locale,
    this.seed,
    this.total,
    this.data,
  });

  factory PersonListModel.fromMap(Map<String, dynamic> data) {
    return PersonListModel(
      status: data['status'] as String?,
      code: data['code'] as int?,
      locale: data['locale'] as String?,
      seed: data['seed'] as dynamic,
      total: data['total'] as int?,
      data: (data['data'] as List<dynamic>?)
          ?.map((e) => PersonListDatum.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'code': code,
        'locale': locale,
        'seed': seed,
        'total': total,
        'data': data?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PersonListModel].
  factory PersonListModel.fromJson(String data) {
    return PersonListModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PersonListModel] to a JSON string.
  String toJson() => json.encode(toMap());

  PersonListModel copyWith({
    String? status,
    int? code,
    String? locale,
    dynamic seed,
    int? total,
    List<PersonListDatum>? data,
  }) {
    return PersonListModel(
      status: status ?? this.status,
      code: code ?? this.code,
      locale: locale ?? this.locale,
      seed: seed ?? this.seed,
      total: total ?? this.total,
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, code, locale, seed, total, data];
}
