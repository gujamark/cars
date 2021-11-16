import '../screens/home_screen.dart';
import '../screens/add_screen.dart';
import '../screens/edit_screen.dart';
import '../screens/car_details_screen.dart';

var routePaths = {
  AddCarScreen.routeName: (ctx) => const AddCarScreen(),
  HomeScreen.routeName: (ctx) => const HomeScreen(),
  EditCarScreen.routeName: (ctx) => const EditCarScreen(),
  CarDetailsScreen.routeName: (ctx) => const CarDetailsScreen()
};
