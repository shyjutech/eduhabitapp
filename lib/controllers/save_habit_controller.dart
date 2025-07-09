import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Uncomment when ready to use Firebase
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class SaveHabitController extends GetxController {
  // Form controllers
  final habitNameController = TextEditingController();
  final quantityController = TextEditingController();
  final unitController = TextEditingController();
  final reminderTimeController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();

  // Reactive variables
  final _selectedDays = <int>{}.obs;
  final _isLoading = false.obs;
  final _isReminderEnabled = false.obs;

  // Date and time storage
  DateTime? _startDate;
  DateTime? _endDate;
  TimeOfDay? _reminderTime;

  // Day labels and names
  final List<String> dayLabels = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
  final List<String> dayNames = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  // Getters
  Set<int> get selectedDays => _selectedDays.value;
  bool get isLoading => _isLoading.value;
  bool get isReminderEnabled => _isReminderEnabled.value;
  DateTime? get startDate => _startDate;
  DateTime? get endDate => _endDate;
  TimeOfDay? get reminderTime => _reminderTime;

  // Check if a day is selected
  bool isDaySelected(int dayIndex) {
    return _selectedDays.contains(dayIndex);
  }

  // Toggle day selection
  void toggleDay(int dayIndex) {
    if (_selectedDays.contains(dayIndex)) {
      _selectedDays.remove(dayIndex);
    } else {
      _selectedDays.add(dayIndex);
    }
    // Trigger UI update
    _selectedDays.refresh();
  }

  // Toggle reminder
  void toggleReminder(bool value) {
    _isReminderEnabled.value = value;
    if (!value) {
      // Clear reminder time when disabled
      reminderTimeController.clear();
      _reminderTime = null;
    }
  }

  // Set reminder time
  void setReminderTime(TimeOfDay time) {
    _reminderTime = time;
  }

  // Set start date
  void setStartDate(DateTime date) {
    _startDate = date;
  }

  // Set end date
  void setEndDate(DateTime date) {
    _endDate = date;
  }

  // Clear all selected days
  void clearSelectedDays() {
    _selectedDays.clear();
  }

  // Select all days
  void selectAllDays() {
    _selectedDays.value = {0, 1, 2, 3, 4, 5, 6};
  }

  // Get selected day names as string
  String getSelectedDaysString() {
    if (_selectedDays.isEmpty) return 'No days selected';

    List<String> selectedDayNames =
        _selectedDays.map((index) => dayNames[index]).toList()
          ..sort((a, b) => dayNames.indexOf(a).compareTo(dayNames.indexOf(b)));

    if (selectedDayNames.length == 7) return 'Every day';
    if (selectedDayNames.length == 5 &&
        !selectedDayNames.contains('Saturday') &&
        !selectedDayNames.contains('Sunday')) {
      return 'Weekdays';
    }
    if (selectedDayNames.length == 2 &&
        selectedDayNames.contains('Saturday') &&
        selectedDayNames.contains('Sunday')) {
      return 'Weekends';
    }

    return selectedDayNames.join(', ');
  }

  // Validate form
  bool validateForm() {
    if (habitNameController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter a habit name');
      return false;
    }

    if (quantityController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter a quantity');
      return false;
    }

    if (unitController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter a unit');
      return false;
    }

    if (_selectedDays.isEmpty) {
      Get.snackbar('Error', 'Please select at least one day');
      return false;
    }

    // Validate dates if both are set
    if (_startDate != null && _endDate != null) {
      if (_endDate!.isBefore(_startDate!)) {
        Get.snackbar('Error', 'End date cannot be before start date');
        return false;
      }
    }

    return true;
  }

  // Save habit - Firebase Integration Example
  Future<void> saveHabit() async {
    if (!validateForm()) return;

    _isLoading.value = true;

    try {
      // Prepare habit data
      final habitData = {
        'habitName': habitNameController.text.trim(),
        'quantity': int.tryParse(quantityController.text.trim()) ?? 0,
        'unit': unitController.text.trim(),
        'selectedDays': _selectedDays.toList(),
        'selectedDaysString': getSelectedDaysString(),
        'isReminderEnabled': _isReminderEnabled.value,
        'reminderTime':
            _reminderTime != null
                ? '${_reminderTime!.hour}:${_reminderTime!.minute}'
                : null,
        'startDate': _startDate?.toIso8601String(),
        'endDate': _endDate?.toIso8601String(),
        'createdAt': DateTime.now().toIso8601String(),
        'isActive': true,
        'streak': 0,
      };

      // 🔥 FIREBASE INTEGRATION (uncomment when ready)
      /*
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('habits')
            .add(habitData);
      }
      */

      // For now, just simulate API call
      await Future.delayed(Duration(seconds: 1));

      print('Saving habit: $habitData'); // Debug print

      // Show success message
      Get.snackbar(
        'Success',
        'Habit "${habitNameController.text}" saved successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.primaryColor,
        colorText: Get.theme.colorScheme.onPrimary,
        duration: Duration(seconds: 3),
      );

      // Clear form after successful save
      clearForm();

      // Navigate back or to habits list
      // Get.back(); // Uncomment to go back
      // Get.toNamed('/habits'); // Or navigate to habits list
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to save habit: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      _isLoading.value = false;
    }
  }

  // Clear form
  void clearForm() {
    habitNameController.clear();
    quantityController.clear();
    unitController.clear();
    reminderTimeController.clear();
    startDateController.clear();
    endDateController.clear();
    _selectedDays.clear();
    _isReminderEnabled.value = false;
    _startDate = null;
    _endDate = null;
    _reminderTime = null;
  }

  @override
  void onClose() {
    // Dispose controllers when controller is destroyed
    habitNameController.dispose();
    quantityController.dispose();
    unitController.dispose();
    reminderTimeController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    super.onClose();
  }
}
