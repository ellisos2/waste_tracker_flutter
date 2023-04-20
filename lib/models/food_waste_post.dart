class FoodWastePost {
  int? leftoverItems;
  String? latitude;
  String? longitude;
  String? imageUrl;
  DateTime? date;

  FoodWastePost({
    leftoverItems,
    latitude,
    longitude,
    imageUrl, 
    date
  });

  void saveLatitudeAndLogitudeAsString(double latitudeNumber, double longitudeNumber) {
    latitude = latitudeNumber.toString();
    longitude = longitudeNumber.toString();
  }

  void saveLeftoverItemsFromString(String leftoverItemsString) {
    leftoverItems = int.parse(leftoverItemsString);
  }

  void setDate() {
    date = DateTime.now();
  }

}
