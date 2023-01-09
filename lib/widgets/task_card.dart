import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/task_model.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task});

  final Task task;
  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: task,
      dragAnchorStrategy: pointerDragAnchorStrategy,
      feedback: Text(
        task.title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _buildImage(),
          SizedBox(
            height: 10,
          ),
          ..._buildCardInfo(context),
          SizedBox(
            height: 5,
          ),
          _buildCardAdditionalinfo()
        ]),
      ),
    );
  }

  Widget _buildCardAdditionalinfo() {
    return (task.commentCount > 0 || task.attachmentCount > 0)
        ? Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(children: [
              (task.commentCount > 0)
                  ? Row(
                      children: [
                        Text('${task.commentCount}'),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.favorite, color: Colors.red,)
                      ],
                    )
                  : const SizedBox(),
              const SizedBox(width: 10),
              (task.attachmentCount > 0)
                  ? Row(
                      children: [
                        Text('${task.commentCount}'),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.comment)
                      ],
                    )
                  : const SizedBox(),
            ]),
          )
        : const SizedBox();
  }

  List<Widget> _buildCardInfo(BuildContext context) {
    return [
      Text(
        task.title,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        task.descripion,
        maxLines: 2,
      )
    ];
  }

//
  Widget _buildImage() {
    return (task.image == null)
        ? SizedBox()
        : ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: task.image!,
              width: double.infinity,
              height: 100,
              fit: BoxFit.cover,
            ),
          );
  }
}
