import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // static CollectionReference users =
  //     FirebaseFirestore.instance.collection('users');

  // static Future<void> addUser(String email, String uid) async {
  //   // Call the user's CollectionReference to add a new user
  //   return await users
  //       .doc(uid)
  //       .set({
  //         'userUid': uid,
  //         'userEmail': email,
  //       })
  //       .then((value) => print("User Added"))
  //       .catchError((error) => print("Failed to add user: $error"));
  // }

  static Stream getHistory() {
    Stream todoStream = FirebaseFirestore.instance
        .collection('patients')
        .snapshots();
    return todoStream;
  }

  // static Future<TodoModel> addTodoItem(String uid, String title,
  //     String description, String date, File image) async {
  //   String imageUrl;
  //   String todoId;
  //   // Call the user's CollectionReference to add a new user
  //   if (image != null) {
  //     imageUrl = await _addImageToFirebase(image, uid);
  //   }
  //   await users
  //       .doc(uid)
  //       .collection("todo")
  //       .add({
  //         'uid': uid,
  //         'title': title,
  //         'description': description,
  //         'date': date,
  //         'image': imageUrl ?? null
  //       })
  //       .then((value) => {todoId = value.id})
  //       .catchError((error) => print("Failed to add user: $error"));

  //   return TodoModel(
  //       uid: uid,
  //       title: title,
  //       description: description,
  //       date: date,
  //       imageUrl: imageUrl ?? null,
  //       todoId: todoId);
  // }

  // static Future<TodoModel> updateTodoItem(
  //     String uid,
  //     String title,
  //     String description,
  //     String date,
  //     File image,
  //     String imageUrlOld,
  //     String todoId) async {
  //   String imageUrl;
  //   // Call the user's CollectionReference to add a new user
  //   if (image != null) {
  //     imageUrl = await _addImageToFirebase(image, uid);
  //   }
  //   await users.doc(uid).collection("todo").doc(todoId).set({
  //     'uid': uid,
  //     'title': title,
  //     'description': description,
  //     'date': date,
  //     'image': imageUrl != null ? imageUrl : imageUrlOld ?? null
  //   }).catchError((error) => print("Failed to add user: $error"));

  //   return TodoModel(
  //       uid: uid,
  //       title: title,
  //       description: description,
  //       date: date,
  //       imageUrl: imageUrl ?? null,
  //       todoId: todoId);
  // }

  // static Future<TodoModel> deleteTodoItem(String uid, String todoId) async {
  //   CollectionReference todo = FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(uid)
  //       .collection('todo');

  //   await todo
  //       .doc(todoId)
  //       .delete()
  //       .catchError((error) => print("Failed to add user: $error"));

  //   return TodoModel(
  //       uid: uid, todoId: todoId, date: '', description: '', title: '');
  // }
}