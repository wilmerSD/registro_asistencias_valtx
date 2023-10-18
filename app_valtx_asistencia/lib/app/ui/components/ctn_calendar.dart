import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CtnCalendar extends StatelessWidget {
  const CtnCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: Container(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        child: SfDateRangePicker(
          allowViewNavigation: false,
          enablePastDates: false,
          todayHighlightColor: Colors.grey,
          headerStyle: const DateRangePickerHeaderStyle(
              textAlign: TextAlign.center,
              textStyle: TextStyle(
                color: Colors.white,
              )
          ),
          showNavigationArrow: false,
          selectionShape: DateRangePickerSelectionShape.circle,
          selectionColor: Colors.transparent,
          view: DateRangePickerView.month,
          monthViewSettings: const DateRangePickerMonthViewSettings(
            viewHeaderStyle: DateRangePickerViewHeaderStyle(
              textStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          cellBuilder:
              (BuildContext context, DateRangePickerCellDetails cellDetails) {
            final DateTime currentDate = cellDetails.date;

            Color cellColor = Colors.white;

            DateTime today = DateTime.now();
            if (currentDate.year == today.year &&
                currentDate.month == today.month &&
                currentDate.day == today.day) {
              cellColor = const Color.fromRGBO(
                  38, 52, 113, 1); // Resaltar el día de hoy
            }
            return Row(
              //borrar el row si esta muy desentrado
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.11,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    //border: Border.all(color: cellColor, width: 3.0),
                    color: cellColor,
                  ),
                  child: Center(
                    child: Text(
                      currentDate.day.toString(),
                      style: const TextStyle(
                        color: Colors
                            .grey, // Cambia el color del texto de la fecha a blanco
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
