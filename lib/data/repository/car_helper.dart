import '../dummy_data.dart';
import '../models/car_model.dart';

class CarRepository {
  List<Car> getCars() {
    return DUMMY_DATA;
  }
  
  void addCar(Car car) {
    DUMMY_DATA.add(car);
  }
}