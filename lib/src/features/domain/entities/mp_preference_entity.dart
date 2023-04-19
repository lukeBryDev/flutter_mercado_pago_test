import 'package:equatable/equatable.dart';

class MPPreferenceEntity extends Equatable {
  final String? id;
  final String? initPoint;

  const MPPreferenceEntity({this.id, this.initPoint});

  @override
  List<Object?> get props => [id, initPoint];
}
