// ignore_for_file: depend_on_referenced_packages

import '../../domain/usecase/authetication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class RemoteAuthentication implements Authentication {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future auth(AuthenticationParams params) async {
    try {
      final response = await _firebaseAuth.signInWithEmailAndPassword(
          email: params.email, password: params.secret);
      return response;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<Map<String, dynamic>> signUp(AuthenticationParams params) async {
    try {
      debugPrint('Tentando criar usuário com email: ${params.email}');

      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: params.email,
        password: params.secret,
      );

      final user = userCredential.user;
      if (user == null) {
        throw FirebaseAuthException(
          code: 'user-not-created',
          message: 'Erro ao criar usuário',
        );
      }

      final userData = <String, dynamic>{
        'nome': params.nome,
        'email': params.email,
        'cpf': params.cpf,
      };

      await firestore.collection("usuarios").doc(user.uid).set(userData);
      debugPrint('Usuário criado e dados salvos com sucesso');

      return {
        'uid': user.uid,
        'email': user.email ?? '',
        'userData': userData,
      };
    } on FirebaseAuthException catch (e) {
      debugPrint('FirebaseAuthException: ${e.code} - ${e.message}');
      rethrow;
    } catch (e, stackTrace) {
      debugPrint('Erro no cadastro: $e');
      debugPrint('Stacktrace: $stackTrace');
      rethrow;
    }
  }
}
