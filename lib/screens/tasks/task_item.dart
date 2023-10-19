import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../models/task_model.dart';
import '../../provider/my_provider.dart';

class TaskItem extends StatelessWidget {
  TaskModel task;
  TaskItem({required this.task,super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: Card(
          color:
              pro.modeApp == ThemeMode.light ?
              Colors.white :
              Color(0xFF141922),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          child: Slidable(
            startActionPane: ActionPane(motion:DrawerMotion(),
                children:[
                  SlidableAction(onPressed: (context){

                  },
                      label:"Delete",
                      icon:Icons.delete,
                      backgroundColor:Colors.red),
                  SlidableAction(onPressed: (context){

                  },
                      label:"Edit",
                      icon:Icons.edit,
                      backgroundColor:Colors.blue),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
                child: Row(
                  children: [
                    Container(
                      height: 80,
                      width: 3,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(18)),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${task.title}",
                          style: TextStyle(color: pro.modeApp == ThemeMode.light
                              ?primaryColor
                              : Colors.white,),
                        ),
                        Text(
                          "${task.Description}",
                          style: TextStyle(color: pro.modeApp == ThemeMode.light
                          ?primaryColor
                              : Colors.white,),
                        )
                      ],
                    ),
                    Spacer(),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                        decoration: BoxDecoration(
                            color: pro.modeApp == ThemeMode.light
                                ? primaryColor
                                : Color(0xFF5D9CEC),
                            borderRadius: BorderRadius.circular(8)),
                        child: Icon(
                          Icons.done,
                          color: Colors.white,
                        ))
                  ],
                ),
            ),
          ),
        ),
      );
  }
}
