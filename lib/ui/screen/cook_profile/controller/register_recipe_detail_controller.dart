import 'package:get/get.dart';
import 'package:gharoghari/ui/screen/cook_profile/register_recipe_detail_screen.dart';

class RegisterRecipeDetailController extends GetxController {
  final String categoryUpdate = "categoryUpdate";
  final String weekDayUpdate = "weekDayUpdate";
  final String dateUpdate = "dateUpdate";

  FoodVegType _foodVegType = FoodVegType.veg;

  FoodVegType get foodVegType => _foodVegType;

  set foodVegType(FoodVegType value) {
    _foodVegType = value;
    update([categoryUpdate]);
  }

  List<WeekDayName> weekDay = [];

  void addRemoveWeekDay(WeekDayName weekDayName) {
    if (weekDay.contains(weekDayName)) {
      weekDay.remove(weekDayName);
    } else {
      weekDay.add(weekDayName);
    }
    update([weekDayUpdate]);
  }

  List<int> dateSelected = [];

  void addRemoveDateDay(int index) {
    if (dateSelected.contains(index)) {
      dateSelected.remove(index);
    } else {
      dateSelected.add(index);
    }
    update([dateUpdate]);
  }
}
