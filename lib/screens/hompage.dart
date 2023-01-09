import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/stage_model.dart';
import '../widgets/task_drag.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List stages = Stage.stages;
    return Scaffold(
      body: LayoutBuilder(
        //Проверка размер Экрана
        builder: (context, constraints) {
          if (constraints.maxWidth > 1200) {
            return _DesktopLayout(
              constraints: constraints,
              stages: stages,
            );
          } else {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: _TableLayout(
                constraints: constraints,
                stages: stages,
              ),
            );
          }
        },
      ),
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  const _DesktopLayout({required this.constraints, required this.stages});

  final BoxConstraints constraints;
  final List stages;
  @override
  Widget build(BuildContext context) {
    return Container(
    color: Colors.grey[300],
      margin: EdgeInsets.all(20),
        child: Row(
          children: [
            _Sideabar(),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ScreenTable(),
                  Expanded(
                    child: TaskDragTarget(
                      stages: stages,
                      constraints: constraints,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
    
    );
  }
}

class _TableLayout extends StatelessWidget {
  const _TableLayout({required this.constraints, required this.stages});

  final BoxConstraints constraints;
  final List stages;
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.grey[400],
      margin: EdgeInsets.all(20),
        child: Row(
          children: [
            _Sideabar(),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ScreenTable(),
                 SizedBox(
                    height:  constraints.maxHeight * 0.8,
                  child: TaskDragTarget(
                    stages: stages,
                    constraints: constraints,
                  ),
                )
              ],
            )
          ],
        ),
     
    );
  }
}

class _Sideabar extends StatelessWidget {
  const _Sideabar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      Icons.home,
      Icons.stacked_bar_chart,
      Icons.email,
      Icons.analytics,
      Icons.settings
    ];
    return Container(
      width: 90,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Image.asset('assets/logo.jpg'),
          const Spacer(
            flex: 1,
          ),
          ListView.separated(
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return IconButton(
                onPressed: () {},
                color: Colors.blue,
                iconSize: 30,
                icon: Icon(icons[index]),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 20,
              );
            },
          ),
          const Spacer(
            flex: 5,
          )
        ],
      ),
    );
  }
}

class _ScreenTable extends StatelessWidget {
  const _ScreenTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text('Рейтинг Универов',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
    );
  }
}
