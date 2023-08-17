import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:budget_tracker/list.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ required this.uid });

  final CollectionReference budgets = FirebaseFirestore.instance.collection('budget');

  Future updateUserData(String category, int price) async {
    return await budgets.doc(uid).set({
      'category': category,
      'price': price,
    });
  }

  List<Track> _budgetListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Track(
        category: (doc.data as DocumentSnapshot)['category'] ?? '',
        price: (doc.data as DocumentSnapshot)['price'] ?? 0,
      );
    }).toList();
  }

  Stream<List<Track>> get budget {
    return budgets.snapshots().map(_budgetListFromSnapshot);
  }

}