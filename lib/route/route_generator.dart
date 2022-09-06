import 'package:get/get.dart';
import 'package:gharoghari/ui/screen/authentication/login_screen.dart';
import 'package:gharoghari/ui/screen/authentication/sign_up/create_account_screen.dart';
import 'package:gharoghari/ui/screen/authentication/widget/check_your_mail_screen.dart';
import 'package:gharoghari/ui/screen/cart/item_check_out_screen.dart';
import 'package:gharoghari/ui/screen/cart/widget/order_confirmation_screen.dart';
import 'package:gharoghari/ui/screen/cook_profile/add_recipe_screen.dart';
import 'package:gharoghari/ui/screen/cook_profile/recipe_page_screen.dart';
import 'package:gharoghari/ui/screen/cook_profile/register_recipe_detail_screen.dart';
import 'package:gharoghari/ui/screen/cook_profile/register_recipe_screen.dart';
import 'package:gharoghari/ui/screen/dashboard/dashboard_screen.dart';
import 'package:gharoghari/ui/screen/favourite/favourite_item_screen.dart';
import 'package:gharoghari/ui/screen/home/widget/item_details_screen.dart';
import 'package:gharoghari/ui/screen/location/location_input_screen.dart';
import 'package:gharoghari/ui/screen/onboarding/onboarding.dart';
import 'package:gharoghari/ui/screen/order_history/order_history_screen.dart';
import 'package:gharoghari/ui/screen/profile/profile_screen.dart';
import 'package:gharoghari/ui/screen/profile/widget/edit_profile_screen.dart';

import '../ui/screen/authentication/widget/enter_otp_screen.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(name: LoginScreen.routeName, page: () => const LoginScreen()),
  GetPage(
      name: OnBoardingScreen.routeName, page: () => const OnBoardingScreen()),
  GetPage(
      name: CheckYourMailScreen.routeName,
      page: () => const CheckYourMailScreen()),
  GetPage(name: EnterOTPScreen.routeName, page: () => const EnterOTPScreen()),
  GetPage(
      name: CreateAccountScreen.routeName,
      page: () => const CreateAccountScreen()),
  GetPage(
      name: LocationInputScreen.routeName,
      page: () => const LocationInputScreen()),
  GetPage(name: DashBoardScreen.routeName, page: () => const DashBoardScreen()),
  GetPage(
      name: ItemDetailScreen.routeName, page: () => const ItemDetailScreen()),
  GetPage(
      name: ItemCheckOutScreen.routeName,
      page: () => const ItemCheckOutScreen()),
  GetPage(name: ProfileScreen.routeName, page: () => const ProfileScreen()),
  GetPage(
      name: EditProfileScreen.routeName, page: () => const EditProfileScreen()),
  GetPage(name: AddRecipeScreen.routeName, page: () => const AddRecipeScreen()),
  GetPage(
      name: RegisterRecipeScreen.routeName,
      page: () => const RegisterRecipeScreen()),
  GetPage(
      name: RecipePageScreen.routeName, page: () => const RecipePageScreen()),
  GetPage(
      name: RegisterRecipeDetailScreen.routeName,
      page: () => const RegisterRecipeDetailScreen()),
  GetPage(
      name: FavouriteItemScreen.routeName,
      page: () => const FavouriteItemScreen()),
  GetPage(
      name: OrderHistoryScreen.routeName,
      page: () => const OrderHistoryScreen()),
  GetPage(
      name: OrderConfirmationScreen.routeName,
      page: () => const OrderConfirmationScreen()),
];
