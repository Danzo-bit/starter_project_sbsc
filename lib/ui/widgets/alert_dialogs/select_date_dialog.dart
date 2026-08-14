import '../../../core/constants/app_theme/custom_color_scheme.dart';
import '../../../core/constants/color_path.dart';
import '../../../core/utilities/navigator.dart';
import '../../../core/utilities/utilities.dart';
import '../../widgets/show_flush_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

selectDateDialog({
  required BuildContext context,
  required ValueChanged<String?> returningValue,
  DateTime? initialDate,
  DateTime? minDate,
  DateTime? maxDate,
  bool isBirthDate = false,
}) {
  // print('iniital date:::$initialDate>>>>');
  return AlertDialog(
    // backgroundColor: Colors.white,
    title: Text(
      'Select Date',
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w400,
        color: Theme.of(context).colorScheme.textPrimary,
      ),
    ),
    content: SizedBox(
      height: 300.h,
      width: MediaQuery.of(context).size.width,
      child: SfDateRangePicker(
        backgroundColor: Colors.transparent,
        confirmText: 'OK',
        cancelText: 'Cancel',
        minDate: minDate,
        maxDate: maxDate,
        initialSelectedDate: initialDate,
        showActionButtons: true,
        selectionColor: ColorPath.gullGrey,
        rangeSelectionColor: Theme.of(context).colorScheme.textPrimary,
        endRangeSelectionColor: Theme.of(context).colorScheme.textPrimary,
        startRangeSelectionColor: Theme.of(context).colorScheme.textPrimary,
        todayHighlightColor: Theme.of(context).colorScheme.textPrimary,
        onCancel: () {
          popNavigation(context: context);
        },
        onSubmit: (value) {
          if (value == null) {
            showFlushBar(
              context: context,
              message: 'Select a date to proceed',
              success: false,
            );
            return;
          }

          final selectedDate = value as DateTime;
          if (isBirthDate) {
            final today = DateTime.now();
            final minAge = DateTime(today.year - 18, today.month, today.day);

            if (selectedDate.isAfter(minAge)) {
              showFlushBar(
                context: context,
                message: 'You must be at least 18 years old to proceed',
                success: false,
              );
              return;
            }
          }

          String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);
          returningValue(formattedDate);
          popNavigation(context: context);
          Utilities.hideKeyboard(context);
        },
        headerStyle: DateRangePickerHeaderStyle(
          backgroundColor: Colors.transparent,
          textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w400,
            // color: Theme.of(context).colorScheme.textPrimary,
          ),
        ),
        selectionTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w400,
          // color: Colors.white,
        ),
        rangeTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w400,
          color: Theme.of(context).colorScheme.textSecondary,
        ),
        onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {},
        selectionMode: DateRangePickerSelectionMode.single,
      ),
    ),
  );
}
