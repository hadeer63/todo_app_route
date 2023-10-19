import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/models/user_model.dart';

class FirebaseFunctions {




  static CollectionReference<TaskModel> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
  }

  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
  }



  static Future<void> addTask(TaskModel taskModel) {

    var collection=getTaskCollection();
    var docRef=collection.doc();
    taskModel.id=docRef.id;
    return docRef.set(taskModel);

  }

 static Stream <QuerySnapshot<TaskModel>> getTasks( DateTime dateTime){
   return getTaskCollection().where("userId",isEqualTo:
   FirebaseAuth.instance.currentUser!.uid)
       .where("date",isEqualTo:
  DateUtils.dateOnly(dateTime).millisecondsSinceEpoch).snapshots();
  }

  static void deleteTasks(String id){
    getTaskCollection().doc(id).delete();
  }

  static void updateTask(TaskModel task){
    getTaskCollection().doc(task.id).update(
      task.toJson());
  }


  static Future<void> addUserToFirestore(UserModel userModel){
    var collection=getUserCollection();
    var docRef=collection.doc(userModel.id);
    return docRef.set(userModel);

  }

  static Future<void> createUser(String name,int age,String email,String password, Function onSuccess,Function onEror)async{

    try{
      final credential=await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
      );
      if(credential.user!.uid!= null){
        UserModel user=UserModel(
            id: credential.user!.uid,
            name: name,
            email: email,
            age: age);
        addUserToFirestore(user).then((value){
          credential.user!.sendEmailVerification();
          onSuccess();
        });
      }
    }on FirebaseAuthException catch (e){
      if(e.code=="week-password"){
        onEror(e.message);
        print("The password provided is too weak.");
      }else if(e.code=="email-already-in-use"){
        onEror(e.message);
        print("The account already exists for that email.");
      }
    }catch(e){
      print(e);
    }
  }

  static Future<void> login(String email,String password, Function onSuccess,Function onEror)async{
    try{
      final credential=await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if(credential.user!.uid!= null){
       // var user=await readUserFirestore(credential.user!.uid);
        if(credential.user!.emailVerified) {
          onSuccess();
        }else{
          onEror('please verify your email');
        }
      }
    }on FirebaseAuthException catch (e){
      print("saturday ${e.message}");
      print("saturday ${e.code}");
      onEror("Wrong mail or password");
      // if(e.code=="user-not-found"){
      //   onEror(e.message);
      //   print("No user found that email.");
      // }else if(e.code=="wrong-password") {
      //   onEror(e.message);
      //   print("Wrong password provided for that user.");
      // }
    }
  }

  static Future<UserModel?>readUserFirestore(String id)async{
    DocumentSnapshot<UserModel> doc=await
    getUserCollection().doc(id).get();
    return doc.data();
  }


}


