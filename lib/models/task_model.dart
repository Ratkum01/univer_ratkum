import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:maneg_ratkum/models/stage_model.dart';

class Task extends Equatable {
  final String id;
  final String title;
  final String descripion;
  final int commentCount;
  final int attachmentCount;
  final Stage? stage;
  final ImageProvider? image;

  Task(
      {required this.id,
      required this.title,
      required this.descripion,
      required this.commentCount,
      required this.attachmentCount,
      this.stage,
      this.image});

//МЕТОД КОПИРОВАНИЯ
  Task copyWith(
      {String? id,
      String? title,
      String? descripion,
      int? commentCount,
      int? attachmentCount,
      Stage? stage,
      ImageProvider? image}) {
    return Task(
        id: id ?? this.id,
        title: title ?? this.title,
        descripion: descripion ?? this.descripion,
        commentCount: commentCount ?? this.commentCount,
        attachmentCount: attachmentCount ?? this.attachmentCount,
        stage: stage ?? this.stage,
        image: image ?? this.image,);
  }

  static List tasks = [
    Task(
        id: '1',
        title: 'Медицинский Университет Караганды',
        descripion: 'Nulla',
        commentCount: 3,
        attachmentCount: 1,
        image: NetworkImage(
            'https://univery.kz/images/qmu.jpg'),
        stage: Stage.stages[0]),
    Task(
        id: '2',
        title: 'Карагандинский государственный университет им. академика Е. А. Букетова (КарГУ) ',
        descripion: 'Nulla',
        commentCount: 3,
        attachmentCount: 1,
        image: NetworkImage(
            'https://univery.kz/images/ksu.jpg'),
        stage: Stage.stages[0]),
    Task(
        id: '3',
        title: 'Академия Bolashaq - Караганда',
        descripion: 'Nulla',
        commentCount: 3,
        attachmentCount: 1,
        image: NetworkImage(
            'https://univery.kz/images/bolashak-universitet-karaganda.jpg'),
        stage: Stage.stages[0]),
    Task(
        id: '3',
        title: 'Карагандинский экономический университет Казпотребсоюза (КЭУК) - Караганда',
        descripion: 'Nulla',
        commentCount: 3,
        attachmentCount: 1,
        image: NetworkImage(
            'https://univery.kz/images/keu.jpg'),
        stage: Stage.stages[0]),
    Task(
        id: '4',
        title: 'Карагандинский Государственный Технический Университет (КарГТУ) - Караганда',
        descripion: 'Nulla',
        commentCount: 3,
        attachmentCount: 1,
        image: NetworkImage(
            'https://univery.kz/images/kstu.jpg'),
        stage: Stage.stages[1]),
    Task(
        id: '5',
        title: 'Алматинская Академия Экономики и Статистики ЦДОТ, филиал - Караганда',
        descripion: 'Nulla',
        commentCount: 3,
        attachmentCount: 1,
        image: NetworkImage(
            'https://univery.kz/images/aesa.jpg'),
        stage: Stage.stages[2])
  ];

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, title, descripion, commentCount, attachmentCount, image, stage];
}
