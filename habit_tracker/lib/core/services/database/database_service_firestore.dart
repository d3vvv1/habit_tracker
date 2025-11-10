// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:habit_tracker/core/services/database/database_service.dart';

class DatabaseServiceFirestore implements DatabaseService {
  @override
  Future<void> dispose() async {}

  // @override
  // Future<List<TodoTaskModel>> getTasks() async {
  //   // final db = FirebaseFirestore.instance;
  //   // final snapshot = await db.collection('tasks').get();
  //   // return snapshot.docs.map((doc) {
  //   //   final data = doc.data();
  //   //   return TodoTaskModel(
  //   //     id: doc.id,
  //   //     title: data['title'],
  //   //     date: data['date'].toDate(),
  //   //     isCompleted: data['is_completed'],
  //   //   );
  //   // }).toList();
  //   return [];
  // }

  @override
  Future<void> init() async {}
}
