import 'package:flutter/material.dart';
import 'package:maneg_ratkum/models/task_model.dart';
import 'package:maneg_ratkum/widgets/task_card.dart';

import '../models/stage_model.dart';

class TaskDragTarget extends StatefulWidget {
  const TaskDragTarget({
    Key? key,
    required this.stages,
    required this.constraints,
  }) : super(key: key);

  final List stages;
  final BoxConstraints constraints;
  @override
  State<TaskDragTarget> createState() => _TaskDragTargetState();
}

class _TaskDragTargetState extends State<TaskDragTarget> {
  late List tasks;
  @override
  void initState() {
    // TODO: implement initState
    tasks = Task.tasks;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (Stage stage in widget.stages)
          (widget.constraints.maxWidth > 1200)
              ? Expanded(child: _buildDragTarget(context, stage))
              : _buildDragTarget(context, stage)
      ],
    );
  }

  Container _buildDragTarget(BuildContext context, Stage stage) {
    List stageTask = tasks.where((task) => task.stage == stage).toList();
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(children: [
        Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  color: stage.color, borderRadius: BorderRadius.circular(5)),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(stage.name,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold))
          ],
        ),
        Divider(
          color: stage.color,
          height: 20,
          thickness: 2,
        ),
        Expanded(
          child: DragTarget<Task>(
            builder: (context, candidateData, rejectedData) {
              return Container(
                width: 300,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: ListView.builder(
                    shrinkWrap: true,
                    controller: ScrollController(),
                    itemCount: stageTask.length,
                    itemBuilder: (context, index) {
                      return TaskCard(task: stageTask[index]);
                    }),
              );
            },
            onAccept: (task) {
              setState(() {
                Task newTask = task.copyWith(stage: stage);
                tasks = List.from(tasks)
                  ..remove(task)
                  ..add(newTask);
              });
            },
          ),
        )
      ]),
    );
  }
}
