import 'package:eduhabit/controllers/save_habit_controller.dart';
import 'package:eduhabit/themes/theme.dart';
import 'package:eduhabit/widgets/custom_appbar.dart';
import 'package:eduhabit/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaveHabitViiew extends StatelessWidget {
  const SaveHabitViiew({super.key});

  @override
  Widget build(BuildContext context) {
    final String title = "Create Habit";
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive dimensions
    final isTablet = screenWidth > 600;
    final horizontalPadding = screenWidth * 0.04; // 4% of screen width
    final verticalSpacing = screenHeight * 0.02; // 2% of screen height
    final containerPadding = screenWidth * 0.025; // 2.5% of screen width
    final iconSize = screenWidth * 0.08; // 8% of screen width
    final circleSize = screenWidth * 0.1; // 10% of screen width for day circles
    final buttonHeight = screenHeight * 0.06; // 6% of screen height
    final fontSize = screenWidth * 0.04; // 4% of screen width

    // Initialize the controller
    final controller = Get.put(SaveHabitController());
    final preferredSize = Size.fromHeight(
      screenHeight * 0.07,
    ); // 7% of screen height
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Theme-aware colors
    final isDarkMode = theme.brightness == Brightness.dark;
    final backgroundColor =
        isDarkMode ? AppThemes.backgroundDark : AppThemes.backgroundLight;
    final cardColor =
        isDarkMode ? AppThemes.cardColorDark : AppThemes.cardColorLight;
    final primaryColor = AppThemes.primaryDefault;
    final textColor = isDarkMode ? Colors.white : AppThemes.textPrimary;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: PreferredSize(
          preferredSize: preferredSize,
          child: CustomAppBar(
            title: title,
            foregroundColor: isDarkMode ? Colors.white : AppThemes.textPrimary,
            showBackButton: true,
            backgroundColor:
                isDarkMode ? AppThemes.cardColorDark : AppThemes.cardColorLight,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalSpacing,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Habit Name Section
                    SizedBox(height: verticalSpacing * 0.5),
                    Container(
                      decoration: BoxDecoration(
                        color: cardColor,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(
                          containerPadding * 0.8,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor.withOpacity(0.1),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                            child: CustomText("Habit", textcolor: textColor),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 8, 15, 0),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(containerPadding),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppThemes.secondaryDefault,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      containerPadding * 0.8,
                                    ),
                                    color: backgroundColor,
                                  ),
                                  child: Icon(
                                    Icons.calendar_month,
                                    color: primaryColor,
                                    size: iconSize,
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.025),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppThemes.secondaryDefault,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        containerPadding * 0.8,
                                      ),
                                      color: backgroundColor,
                                    ),
                                    child: _buildTextField(
                                      context,
                                      title,
                                      controller.habitNameController,
                                      fontSize: fontSize,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 15),

                          // Goal Section
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: CustomText("Goal", textcolor: textColor),
                          ),

                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 8, 15, 15),
                            child: Row(
                              children: [
                                // Quantity TextField
                                Expanded(
                                  flex:
                                      isTablet ? 3 : 2, // More space on tablets
                                  child: Container(
                                    padding: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppThemes.secondaryDefault,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        containerPadding * 0.8,
                                      ),
                                      color: backgroundColor,
                                    ),
                                    child: _buildTextField(
                                      context,
                                      "Quantity",
                                      controller.quantityController,
                                      keyboardType: TextInputType.number,
                                      fontSize: fontSize,
                                    ),
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.025),
                                // Unit TextField
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppThemes.secondaryDefault,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        containerPadding * 0.8,
                                      ),
                                      color: backgroundColor,
                                    ),
                                    child: _buildTextField(
                                      context,
                                      "Unit",
                                      controller.unitController,
                                      fontSize: fontSize,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: verticalSpacing),

                    // Days Selection Section
                    SizedBox(height: verticalSpacing * 0.5),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(containerPadding),
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(
                          containerPadding * 0.8,
                        ),
                        border: Border.all(color: primaryColor),
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor.withOpacity(0.1),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: _buildDaysSelection(
                        context,
                        controller,
                        circleSize,
                      ),
                    ),

                    SizedBox(height: verticalSpacing * 0.5),
                    Container(
                      padding: EdgeInsets.all(containerPadding),
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(
                          containerPadding * 0.8,
                        ),
                        border: Border.all(color: primaryColor),
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor.withOpacity(0.1),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Reminder Toggle
                          Row(
                            children: [
                              SizedBox(width: 2),
                              CustomText("Reminder", textcolor: textColor),
                              Spacer(),
                              Obx(
                                () => Switch(
                                  value: controller.isReminderEnabled,
                                  onChanged: controller.toggleReminder,
                                  activeColor: primaryColor,
                                ),
                              ),
                            ],
                          ),

                          // Reminder Time Picker (only show when enabled)
                          Obx(
                            () =>
                                controller.isReminderEnabled
                                    ? Column(
                                      children: [
                                        SizedBox(
                                          height: verticalSpacing * 0.75,
                                        ),
                                        _buildTimePickerContainer(
                                          context,
                                          "Reminder Time",
                                          controller.reminderTimeController,
                                          controller,
                                          containerPadding,
                                          fontSize,
                                        ),
                                      ],
                                    )
                                    : SizedBox.shrink(),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 15),

                    // Date Range Section
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(
                          containerPadding * 0.8,
                        ),
                        border: Border.all(color: primaryColor),
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor.withOpacity(0.1),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Start Date Section
                          CustomText("Start Date", textcolor: textColor),
                          SizedBox(height: verticalSpacing * 0.4),
                          _buildDatePickerContainer(
                            context,
                            "mm/dd/yyyy",
                            controller.startDateController,
                            controller,
                            isStartDate: true,
                            containerPadding: containerPadding,
                            fontSize: fontSize,
                          ),

                          SizedBox(height: verticalSpacing * 0.75),

                          // End Date Section
                          CustomText("End Date", textcolor: textColor),
                          SizedBox(height: verticalSpacing * 0.4),
                          _buildDatePickerContainer(
                            context,
                            "mm/dd/yyyy",
                            controller.endDateController,
                            controller,
                            isStartDate: false,
                            containerPadding: containerPadding,
                            fontSize: fontSize,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: verticalSpacing * 1.5),

                    // Save Button
                    Obx(
                      () => SizedBox(
                        width: double.infinity,
                        height: buttonHeight,
                        child: ElevatedButton(
                          onPressed:
                              controller.isLoading
                                  ? null
                                  : controller.saveHabit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                containerPadding * 0.8,
                              ),
                            ),
                            elevation: 3,
                          ),
                          child:
                              controller.isLoading
                                  ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: iconSize * 0.8,
                                        height: iconSize * 0.8,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        ),
                                      ),
                                      SizedBox(width: screenWidth * 0.025),
                                      Text(
                                        "Saving...",
                                        style: TextStyle(fontSize: fontSize),
                                      ),
                                    ],
                                  )
                                  : Text(
                                    "Save Habit",
                                    style: TextStyle(
                                      fontSize: fontSize,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                        ),
                      ),
                    ),

                    SizedBox(height: verticalSpacing * 0.5),

                    // Clear Button
                    SizedBox(
                      width: double.infinity,
                      height: buttonHeight,
                      child: OutlinedButton(
                        onPressed: () {
                          controller.clearForm();
                          Get.snackbar(
                            'Form Cleared',
                            'All fields have been reset successfully',
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Colors.green.shade100,
                            colorText: Colors.green.shade800,
                            icon: Icon(
                              Icons.check_circle,
                              color: Colors.green.shade600,
                            ),
                            duration: Duration(seconds: 2),
                            margin: EdgeInsets.all(horizontalPadding),
                            borderRadius: containerPadding * 0.8,
                            isDismissible: true,
                            dismissDirection: DismissDirection.horizontal,
                            forwardAnimationCurve: Curves.easeOutBack,
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: primaryColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              containerPadding * 0.8,
                            ),
                          ),
                        ),
                        child: Text(
                          "Clear Form",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: fontSize,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    // Bottom spacing for devices with gesture navigation
                    SizedBox(
                      height:
                          MediaQuery.of(context).padding.bottom +
                          verticalSpacing,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build text fields with responsive sizing
  Widget _buildTextField(
    BuildContext context,
    String hintText,
    TextEditingController controller, {
    TextInputType? keyboardType,
    required double fontSize,
  }) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : AppThemes.textPrimary;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        style: TextStyle(color: textColor, fontSize: fontSize),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            color: textColor.withOpacity(0.6),
            fontSize: fontSize,
          ),
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }

  // Beautiful day selection with responsive sizing
  Widget _buildDaysSelection(
    BuildContext context,
    SaveHabitController controller,
    double circleSize,
  ) {
    final screenWidth = MediaQuery.of(Get.context!).size.width;
    final fontSize = screenWidth * 0.035; // Slightly smaller for day labels

    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            "Repeat",
            textcolor:
                Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : AppThemes.textPrimary,
          ),

          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(7, (index) {
              final isSelected = controller.isDaySelected(index);

              return GestureDetector(
                onTap: () => controller.toggleDay(index),
                child: Container(
                  width: circleSize,
                  height: circleSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        isSelected
                            ? AppThemes.primaryDefault.withOpacity(0.2)
                            : Colors.transparent,
                    border: Border.all(
                      color:
                          isSelected ? AppThemes.secondaryDefault : Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      controller.dayLabels[index],
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w600,
                        color:
                            isSelected
                                ? AppThemes.primaryDefault
                                : Colors.grey.shade600,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  // Date picker container with responsive sizing
  Widget _buildDatePickerContainer(
    BuildContext context,
    String labelText,
    TextEditingController dateController,
    SaveHabitController controller, {
    required bool isStartDate,
    required double containerPadding,
    required double fontSize,
  }) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final backgroundColor =
        isDarkMode ? AppThemes.backgroundDark : AppThemes.backgroundLight;
    final textColor = isDarkMode ? Colors.white : AppThemes.textPrimary;
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = screenWidth * 0.05;

    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: AppThemes.secondaryDefault),
        borderRadius: BorderRadius.circular(containerPadding * 0.7),
        color: backgroundColor,
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: dateController,
                readOnly: true,
                style: TextStyle(color: textColor, fontSize: fontSize),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: labelText,
                  hintStyle: TextStyle(
                    color: textColor.withOpacity(0.6),
                    fontSize: fontSize,
                  ),
                  contentPadding: EdgeInsets.zero,
                ),
                onTap:
                    () => _showDatePicker(
                      context,
                      dateController,
                      controller,
                      isStartDate,
                    ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.calendar_month,
                color: AppThemes.primaryDefault,
                size: iconSize,
              ),
              onPressed:
                  () => _showDatePicker(
                    context,
                    dateController,
                    controller,
                    isStartDate,
                  ),
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
            ),
          ],
        ),
      ),
    );
  }

  // Time picker container with responsive sizing
  Widget _buildTimePickerContainer(
    BuildContext context,
    String labelText,
    TextEditingController timeController,
    SaveHabitController controller,
    double containerPadding,
    double fontSize,
  ) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final backgroundColor =
        isDarkMode ? AppThemes.backgroundDark : AppThemes.backgroundLight;
    final textColor = isDarkMode ? Colors.white : AppThemes.textPrimary;
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = screenWidth * 0.05;

    return Container(
      padding: EdgeInsets.all(containerPadding),
      decoration: BoxDecoration(
        border: Border.all(color: AppThemes.primaryDefault),
        borderRadius: BorderRadius.circular(containerPadding * 0.8),
        color: backgroundColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: timeController,
              readOnly: true,
              style: TextStyle(color: textColor, fontSize: fontSize),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: labelText,
                hintStyle: TextStyle(
                  color: textColor.withOpacity(0.6),
                  fontSize: fontSize,
                ),
                contentPadding: EdgeInsets.zero,
              ),
              onTap: () => _showTimePicker(context, timeController, controller),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.access_time,
              color: AppThemes.primaryDefault,
              size: iconSize,
            ),
            onPressed:
                () => _showTimePicker(context, timeController, controller),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
          ),
        ],
      ),
    );
  }

  // Show date picker
  Future<void> _showDatePicker(
    BuildContext context,
    TextEditingController dateController,
    SaveHabitController controller,
    bool isStartDate,
  ) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formattedDate =
          "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}";
      dateController.text = formattedDate;

      // Update the controller with the selected date
      if (isStartDate) {
        controller.setStartDate(pickedDate);
      } else {
        controller.setEndDate(pickedDate);
      }
    }
  }

  // Show time picker
  Future<void> _showTimePicker(
    BuildContext context,
    TextEditingController timeController,
    SaveHabitController controller,
  ) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      String formattedTime = pickedTime.format(context);
      timeController.text = formattedTime;
      controller.setReminderTime(pickedTime);
    }
  }
}
