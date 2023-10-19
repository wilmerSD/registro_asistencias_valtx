import 'package:app_valtx_asistencia/app/ui/views/details/details_controller.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

DateRangePickerController _controller = DateRangePickerController();
DateTime now = DateTime.now();
DateTime maxDate = now;
//DateTime minDate = DateTime(now.year, now.month, 3);
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
        todayHighlightColor: AppColors.blueDark,
        headerStyle: const DateRangePickerHeaderStyle(
            textAlign: TextAlign.center,
            textStyle: TextStyle(
              color: Colors.white,
            )),
        showNavigationArrow: false,
        selectionShape: DateRangePickerSelectionShape.rectangle,
        selectionColor: AppColors.blueDark,
        view: DateRangePickerView.month,
        monthViewSettings: const DateRangePickerMonthViewSettings(
          viewHeaderStyle: DateRangePickerViewHeaderStyle(
            textStyle: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
          // ejecutar función después de la selección.
          DateTime? selectedDate = args.value;
          if (selectedDate != null) {
            // Hacer algo con la fecha seleccionada
            print('Fecha seleccionada: $selectedDate');
            // Llama a tu función aquí.
            // controller.assistancesDayUser(selectedDate);
          }
        },
      ),
    );
  }
}
