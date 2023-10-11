import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/my_provider.dart';
import 'package:todo_app/screens/settings/settings_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/screens/tasks/add_task_bpttom_sheet.dart';
import 'package:todo_app/screens/tasks/tasks_tab.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = 'layout';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int index = 0;

  List<Widget> tabs = [
    TasksTab(),
    SettingTab(),
  ];

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Stack(
      children: [
        Image.asset(
          pro.getBackground(),
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          extendBody: true,
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.todo),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showSheet();
            },
            child: Icon(Icons.add),
            shape: CircleBorder(side: BorderSide(color: Colors.white, width: 3)),
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            notchMargin: 8,
            shape: CircularNotchedRectangle(),
            child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                onTap: (value) {
                  index = value;
                  setState(() {});
                },
                currentIndex: index,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.list,
                        size: 30,
                      ),
                      label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.settings,
                        size: 30,
                      ),
                      label: ""),
                ]),
          ),
          body: tabs[index],
        ),
      ],
    );
  }

  void showSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding:  EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom
          )
          ,
          child: AddTaskBottomSheet(),
        );
      },
    );
  }
}
