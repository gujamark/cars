import '../screens/home_screen.dart';
import '../screens/add_screen.dart';
import '../screens/edit_screen.dart';
import '../screens/car_details_screen.dart';

var route_paths = {
  AddCarScreen.routeName: (ctx) => AddCarScreen(),
  HomeScreen.routeName: (ctx) => HomeScreen(),
  EditCarScreen.routeName: (ctx) => const EditCarScreen(),
  CarDetailsScreen.routeName: (ctx) => const CarDetailsScreen()
};
