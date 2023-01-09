import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Stage extends Equatable {
  final String id;
  final String name;
  final Color color;

  Stage({required this.id, required this.name, required this.color});

  static List stages = [
    Stage(
      id: "Green",
      name: 'Green',
      color: Color.fromARGB(255, 54, 244, 120),
    ),
    Stage(id: 'Yellow', name: 'Yellow', color: Color.fromARGB(255, 242, 255, 0)),
    Stage(
        id: 'Orange',
        name: 'Orange',
        color: Color.fromARGB(255, 255, 166, 0)),
    Stage(id: 'Red', name: 'Red', color: Color.fromARGB(255, 255, 0, 0)),
  ];

  @override
  // TODO: implement props
  List<Object?> get props => [id , name, color];
}
