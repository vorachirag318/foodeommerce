import 'package:get/get.dart';
import 'package:gharoghari/ui/screen/authentication/controller/login_controller.dart';
import 'package:gharoghari/ui/screen/cook_profile/controller/register_recipe_detail_controller.dart';

class RouteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);

    Get.lazyPut<RegisterRecipeDetailController>(
        () => RegisterRecipeDetailController(),
        fenix: true);
  }
}
