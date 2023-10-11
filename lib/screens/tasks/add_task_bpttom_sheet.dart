import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/shared/firebase/firebase_functions.dart';
import 'package:todo_app/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTaskBottomSheet extends StatefulWidget {

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var titleController=TextEditingController();

  var describtionController=TextEditingController();

  var selectedDate=DateTime.now();
  var forKy=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Form(
        key: forKy,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(AppLocalizations.of(context)!.addNewTask,
              textAlign: TextAlign.center,
            style: GoogleFonts.poppins(fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black),),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: titleController,
              validator: (value){
                if(value==null|| value.isEmpty){
                  return AppLocalizations.of(context)!.pleaseEnterTaskTitle;
                }
                return null;
              },
              decoration: InputDecoration(
                label: Text(AppLocalizations.of(context)!.taskTitle),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: primaryColor
                  )
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        color: primaryColor
                    )
                )
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: describtionController,
              validator: (value){
                if(value==null|| value.isEmpty){
                  return AppLocalizations.of(context)!.pleaseEnterTaskDescribtion;
                }
                return null;
              },
              decoration: InputDecoration(
                label: Text(AppLocalizations.of(context)!.taskDescribtion),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: primaryColor
                  )
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        color: primaryColor
                    )
                )
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(AppLocalizations.of(context)!.selectDate,textAlign: TextAlign.start,
                style: GoogleFonts.poppins(fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black)),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){
                selectDate(context);
              },
              child: Text(selectedDate.toString().substring(0,10),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.blue)),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){
               if(forKy.currentState!.validate()){
                 TaskModel taskModel=TaskModel(
                     title: titleController.text,
                     Description: describtionController.text,
                     date: selectedDate.millisecondsSinceEpoch
                 // FirebaseFunctions.addTask(taskModel).then((value) {
                 //   Navigator.pop(context);
                 // }
                 );
               }

            },
                child: Text(AppLocalizations.of(context)!.addTask))
          ],
        ),
      ),
    );
  }

  selectDate(BuildContext context) async{
   DateTime?chosenDate= await showDatePicker(context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
   if(chosenDate==null){
     return;
   }
   selectedDate=chosenDate;
   setState(() {

   });
  }
}
