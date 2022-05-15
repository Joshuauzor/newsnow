import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:newsnow/features/features.dart';

part 'source_model.g.dart';

@JsonSerializable()
class SourceModel extends Source {
  const SourceModel({
    String? id,
    required String name,
  }) : super(
          id: id,
          name: name,
        );

  factory SourceModel.fromJson(Map<String, dynamic> json) =>
      _$SourceModelFromJson(json);

  Map<String, dynamic> toJson() => _$SourceModelToJson(this);
}
