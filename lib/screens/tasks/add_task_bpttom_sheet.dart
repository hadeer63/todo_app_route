import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/shared/styles/colors.dart';

class AddTaskBottomSheet extends StatefulWidget {

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var titleController=TextEditingController();

  var describtionController=TextEditingController();

  var selectedDate=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Add New Task",
            textAlign: TextAlign.center,
          style: GoogleFonts.poppins(fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black),),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
              label: Text("Task Title"),
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
            decoration: InputDecoration(
              label: Text("Task Describtion"),
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
          Text(selectedDate.toString().substring(10),textAlign: TextAlign.start,
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
          ElevatedButton(onPressed: (){},
              child: Text("Add Task"))
        ],
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
