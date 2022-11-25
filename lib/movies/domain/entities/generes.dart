import 'package:equatable/equatable.dart';

class Benres extends Equatable {
  final String name;
  final int id;

  Benres({required this.name, required this.id});
  
  @override
  // TODO: implement props
  List<Object?> get props => [name,id];
}
