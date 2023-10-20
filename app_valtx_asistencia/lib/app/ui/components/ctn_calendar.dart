import 'package:app_valtx_asistencia/app/ui/views/details/details_controller.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

DateRangePickerController _controller = DateRangePickerController();
DateTime now = DateTime.now();
DateTime maxDate = now;
DateTime minDate = DateTime(now.year, now.month, 1);
final datePickerController = DateRangePickerController();

class CtnCalendar extends StatelessWidget {
  const CtnCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(
      builder: (controller) => SfDateRangePicker(
        controller: _controller,
        enablePastDates: true,
        selectionRadius: 20,
        showTodayButton: false,
        selectionTextStyle: const TextStyle(
          color: Colors.white,
        ),
        allowViewNavigation: false,
        maxDate: maxDate,
        //minDate: minDate,
        todayHighlightColor: AppColors.primary,
        headerStyle: const DateRangePickerHeaderStyle(
            textAlign: TextAlign.center,
            textStyle: TextStyle(
              color: AppColors.backgroundColor,
            )),
        showNavigationArrow: false,
        selectionShape: DateRangePickerSelectionShape.rectangle,
        selectionColor: AppColors.primary,
        view: DateRangePickerView.month,
        monthViewSettings: const DateRangePickerMonthViewSettings(
          viewHeaderStyle: DateRangePickerViewHeaderStyle(
            textStyle: TextStyle(
              color: AppColors.grayBlue,
            ),
          ),
        ),
        onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
          DateTime? selectedDate = args.value;
           String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);
          if (formattedDate != '') {
            controller.getAssistancesMonthUser(formattedDate);
            controller.assistancesDayUser(formattedDate);  
          }
        },
      ),
    );
  }
}
