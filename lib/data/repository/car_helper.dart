import '../dummy_data.dart';
import '../models/car_model.dart';

class CarRepository {
  List<Car> getCars() {
    return dummyData;
  }

  void addCar(Car car) {
    dummyData.add(car);
  }

  void editCar(Car car, int index) {
    dummyData.replaceRange(index, index + 1, [car]);
  }

  void removeCar(int id) {
    dummyData.removeWhere((element) => element.id == id);
  }
}
