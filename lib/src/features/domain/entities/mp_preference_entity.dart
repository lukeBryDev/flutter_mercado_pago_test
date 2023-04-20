import 'package:equatable/equatable.dart';

class MPPreferenceEntity extends Equatable {
  final String? id;
  final String? initPoint;
  final String? initPointSandbox;

  const MPPreferenceEntity({this.id, this.initPoint, this.initPointSandbox});

  @override
  List<Object?> get props => [id, initPoint, initPointSandbox];
}
