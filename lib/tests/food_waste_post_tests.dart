import 'package:test/test.dart';
import 'package:waste_tracker/models/food_waste_post.dart';

void main() {
  test('Method converts latitude and longitude double values to strings', () {
    const double latitudeDouble = -42.34;
    const double longitudeDouble = 73.92;

    FoodWastePost foodWastePost = FoodWastePost();
    foodWastePost.saveLatitudeAndLogitudeAsString(latitudeDouble, longitudeDouble);

    const String latitudeString = '-42.34';
    const String longitudeString = '73.92';

    expect(foodWastePost.latitude, isA<String>());
    expect(foodWastePost.latitude, latitudeString);
    expect(foodWastePost.longitude, isA<String>());
    expect(foodWastePost.longitude, longitudeString);
  });

  test('Method saves the current date as the date attribute', () {
    FoodWastePost foodWastePost = FoodWastePost();
    foodWastePost.setDate();

    expect(foodWastePost.date!.day, DateTime.now().day);
    expect(foodWastePost.date!.month, DateTime.now().month);
    expect(foodWastePost.date!.year, DateTime.now().year);
  });

  test('Method converts the given leftover items string value to an integer and saves it', () {
    const String leftoverItemsString = '10';
    
    FoodWastePost foodWastePost = FoodWastePost();
    foodWastePost.saveLeftoverItemsFromString(leftoverItemsString);

    const int leftoverItemsInt = 10;

    expect(foodWastePost.leftoverItems, isA<int>());
    expect(foodWastePost.leftoverItems, leftoverItemsInt);
  });

}

