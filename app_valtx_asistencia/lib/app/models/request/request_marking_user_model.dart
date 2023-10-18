class RequestMarkingUserModel {
    int idUser;
    int idTypesMarking;
    double latitude;
    double longitude;

    RequestMarkingUserModel({
        required this.idUser,
        required this.idTypesMarking,
        required this.latitude,
        required this.longitude,
    });

    Map<String, dynamic> toMap() => {
        "idUser": idUser,
        "idTypesMarking": idTypesMarking,
        "latitude": latitude,
        "longitude": longitude,
    };
}