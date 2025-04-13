// String? _validateFullName(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Full Name cannot be empty';
//     }
//     return null;
//   }

//   String? _validateEmail(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Email cannot be empty';
//     }
//     // Simple email regex check
//     if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//       return 'Enter a valid email';
//     }
//     return null;
//   }

//   String? _validatePassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Password cannot be empty';
//     }
//     if (value.length < 6) {
//       return 'Password must be at least 6 characters';
//     }
//     return null;
//   }

//   String? _validateConfirmPassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please confirm your password';
//     }
//     if (value != _passwordController.text) {
//       return 'Passwords do not match';
//     }
//     return null;
//   }

//   void _submitForm() {
//     // Renamed from _login for clarity
//     if (_formKey.currentState!.validate()) {
//       String fullName = _fullNameController.text;
//       String email = _emailController.text;
//       String password = _passwordController.text;
//       print('Form is valid. Signing up: $fullName, $email');
//       // Add your signup logic here
//     } else {
//       print('Form is invalid');
//     }
//   }