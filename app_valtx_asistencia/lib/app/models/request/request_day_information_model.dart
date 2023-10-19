class RequestDayInformationModel {
    int idUser;
    String date;

    RequestDayInformationModel({
        required this.idUser,
        required this.date,
    });
    Map<String, dynamic>  toMap() => {
        "idUser": idUser,
        "date": date//"${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} " + "${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}:${date.second.toString().padLeft(2, '0')}.${date.microsecond.toString().padLeft(6, '0')}",
    };
}
