import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  Future<void> login(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> register(String email, String password) async {
    final user = await auth.createUserWithEmailAndPassword(email: email, password: password);
    await db.collection('users').doc(user.user!.uid).set({
      'email': email,
      'points': 0,
      'streak': 0,
      'level': 1,
    });
  }

  Future<void> completeChallenge(String uid, int reward) async {
    final ref = db.collection('users').doc(uid);
    await db.runTransaction((tx) async {
      final snap = await tx.get(ref);
      tx.update(ref, {
        'points': snap['points'] + reward,
        'streak': snap['streak'] + 1,
      });
    });
  }
}
