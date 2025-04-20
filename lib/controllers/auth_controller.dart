import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usrnameController=TextEditingController();
  
  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  Future<void> login() async {
    _isLoading.value = true;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      await firestore.collection('user').add({
        'email': emailController.text,
        'password': passwordController.text,
      });
      Get.snackbar('Success', 'Logged in success');
      Get.offAll('/dashboard');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Error', 'Your password very weak');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Error', 'This email is already exist');
      }
    } catch (e) {
      Get.snackbar('Error',' $e');
    } finally {
      _isLoading.value = false;
    }
  }



  // signup 

Future<void> signup() async {
  _isLoading.value = true;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  try {
    // 1. Create user with Firebase Authentication
    final userCredential = await auth.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    // 2. Store user info in Firestore
    await firestore.collection('users').doc(userCredential.user!.uid).set({
      'uid': userCredential.user!.uid,
      'username': usrnameController.text.trim(),
      'email': emailController.text.trim(),
      'createdAt': Timestamp.now(),
    });

    // 3. Show success and navigate
    Get.snackbar('Success', 'Signup Successful!');
    Get.offAllNamed('/dashboard'); // Or wherever you want to navigate
  } on FirebaseAuthException catch (e) {
    // Handle Firebase errors
    if (e.code == 'weak-password') {
      Get.snackbar('Error', 'The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      Get.snackbar('Error', 'The account already exists for that email.');
    } else {
      Get.snackbar('Error', e.message ?? 'An error occurred');
    }
  } catch (e) {
    // Handle any other errors
    Get.snackbar('Error', e.toString());
  } finally {
    _isLoading.value = false;
  }
}


}



