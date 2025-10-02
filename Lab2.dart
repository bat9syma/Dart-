abstract class Transport
{
  String name;
  Transport(this.name);

  double calculateTime(double distance, double speed);
  double calculatePrice(double distance, double weight, int person);

  void info(double distance, double speed, double weight, int person)
  {
    double time = calculateTime(distance, speed);
    double price = calculatePrice(distance, weight, person);

    print("$name: Time = ${time.toStringAsFixed(2)} hours, ""Price = ${price.toStringAsFixed(2)} USD");
  }
}

class Car extends Transport 
{
  double price_per_km;
  double maxWeight = 200;

  Car(String name, this.price_per_km) : super(name);

  @override
  double calculateTime(double distance, double speed)
  {
    return distance / speed;
  }
  
  @override
  double calculatePrice(double distance, double weight, int person)
  {
    if (weight > maxWeight)
    {
      print("$name cannot carry more than $maxWeight kg!");
    }
    return distance * price_per_km + person * 2 + weight * 0.1;
  }
}

class Bicycle extends Transport
{
  Bicycle(String name) : super(name);

  @override
    double calculateTime(double distance, double speed)
    {
      return distance / speed;
    }

  @override
  double calculatePrice(double distance, double weight, int person) 
  {
    if (person > 1 || weight > 10) 
    {
      print("$name cannot carry that many passengers or cargo!");
      return double.infinity; 
    }
    return 2.5 * distance / weight; 
  }
}

class Cart extends Transport
{
  double maintance;
  double maxWeight = 400;

  Cart(String name, this.maintance) : super(name);

  @override
  double calculateTime(double distance, double speed) 
  {
    return distance / speed;
  }

  @override
  double calculatePrice(double distance, double weight, int person) 
  {
  if (weight > maxWeight) 
  {
    print("$name cannot carry more than $maxWeight kg!");
    return double.infinity; 
  }
  return distance * maintance + person * 2 + weight * 0.05;
  }
}

void main()
{
  double distance = 50; // km
  int person = 1;
  double weight = 9; // kg
  double car_speed = 90; 
  double bicycle_speed = 25;
  double cart_speed = 17;

  Transport car = Car("Nissan", 0.4);
  Transport bicycle = Bicycle("Cosmic");
  Transport cart = Cart("Bob", 0.15);

  car.info(distance, car_speed, weight, person);
  bicycle.info(distance, bicycle_speed, weight, person);
  cart.info(distance, cart_speed, weight, person);
}