// import 'dart:js_interop';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:todo_app/models/task_model.dart';
//
// class FirebaseFunctions {
//   static CollectionReference<TaskModel> getTaskCollection()
//
//   return
//
//   FirebaseFirestore.instance.collection
//
//   (
//
//   "
//
//   Tasks
//
//   "
//
//   )
//
//       .
//
//   withConverter<TaskModel>(
//   fromFirestore: (snapshot,_){
//   return TaskModel.fromJson(snapshot.data()!);
//   },
//   toFirestore: (value,_){
//   return value.toJson();
//   }
//   );
//
//
//
//   static Future<void> addTask(TaskModel taskModel){
//     var collection=getTaskCollection();
//     var docRef =collection.doc();
//     taskModel.id=docRef.id;
//     return docRef.set(taskModel);
//   }
// }