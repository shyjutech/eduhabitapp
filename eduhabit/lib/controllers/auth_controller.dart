import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  Future<void> login() async {
    _isLoading.value = true;
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.snackbar('Success', 'Logged in success');
      Get.offAll('/dashboard');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Error', 'Your password very weak');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Error', 'This email is already exist');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      _isLoading.value = false;
    }
  }
}

