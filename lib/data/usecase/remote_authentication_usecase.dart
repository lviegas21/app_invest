// ignore_for_file: depend_on_referenced_packages

import '../../domain/usecase/authetication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:typed_data';

class RemoteAuthentication implements Authentication {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future auth(AuthenticationParams params) async {
    try {
      final response = await _firebaseAuth.signInWithEmailAndPassword(
          email: params.cpf, password: params.secret);
      return response;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future signUp(AuthenticationParams params) async {
    try {
      final response = await _firebaseAuth.createUserWithEmailAndPassword(
          email: params.email, password: params.secret);
      final saveUsuario =
          await firestore.collection("usuarios").doc(response.user?.uid).set({
        'nome': params.nome,
        'email': params.email,
        'senha': params.secret,
        'cpf': params.cpf,
      });
      return response;
    } catch (e) {
      throw e;
    }
  }
}
