import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:pdax_work_trial/features/person_list/domain/entity/entity.dart';

class PersonListEntity extends Equatable {
  const PersonListEntity({
    this.status,
    this.code,
    this.locale,
    this.seed,
    this.total,
    this.data,
  });

  factory PersonListEntity.fromMap(Map<String, dynamic> data) {
    return PersonListEntity(
      status: data['status'] as String?,
      code: data['code'] as int?,
      locale: data['locale'] as String?,
      seed: data['seed'] as dynamic,
      total: data['total'] as int?,
      data: (data['data'] as List<dynamic>?)
          ?.map((e) => PersonListDatumEntity.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the
  /// resulting Json object as [PersonListEntity].
  factory PersonListEntity.fromJson(String data) {
    return PersonListEntity.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  final String? status;
  final int? code;
  final String? locale;
  final dynamic seed;
  final int? total;
  final List<PersonListDatumEntity>? data;

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
  /// Converts [PersonListEntity] to a JSON string.
  String toJson() => json.encode(toMap());

  PersonListEntity copyWith({
    String? status,
    int? code,
    String? locale,
    dynamic seed,
    int? total,
    List<PersonListDatumEntity>? data,
  }) {
    return PersonListEntity(
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
