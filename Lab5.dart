import 'dart:async'; 

class Day 
{
  DateTime date;
  double temperature;
  String comment;

  Day({required this.date, required this.temperature, required this.comment});

  DateTime get getDate => date;
  double get getTemperature => temperature;
  String get getComment => comment;

  set setDate(DateTime newDate) => date = newDate;
  set setTemperature(double newTemperature) => temperature = newTemperature;
  set setComment(String newCommnent) => comment = newCommnent;

  @override
  String toString() =>
      "${date.toIso8601String().split('T')[0]} | ${temperature}°C | $comment";
}

class Weather 
{
  String season;
  String comment;
  List<Day> days; 

  Weather({required this.season, required this.comment, required this.days});

  String get getSeason => season;
  String get getComment => comment;
  List<Day> get getDays => days;

  set setSeason(String newSeason) => season = newSeason;
  set setComment(String newComment) => comment = newComment;
  set setDays(List<Day> newDays) => days = newDays;
}

// Generic Class
class DataProcessor<T> 
{
  List<T> items;

  DataProcessor(this.items);


  // Generic Method AVG
  num average<numT extends num>(numT Function(T) selector) 
  {
    if (items.isEmpty) return 0;
    num sum = 0;
    for (var item in items) 
    {
      sum += selector(item);
    }
    return sum / items.length;
  }

  // // Generic Method Max
  T? maxBy<R extends Comparable>(R Function(T) selector) 
  {
    if (items.isEmpty) return null;
    T maxItem = items.first;
    for (var item in items) 
    {
      if (selector(item).compareTo(selector(maxItem)) > 0) 
      {
        maxItem = item;
      }
    }
    return maxItem;
  }

  /// Generic Method Min
  T? minBy<R extends Comparable>(R Function(T) selector) 
  {
    if (items.isEmpty) return null;
    T minItem = items.first;
    for (var item in items) 
    {
      if (selector(item).compareTo(selector(minItem)) < 0)
       {
        minItem = item;
      }
    }
    return minItem;
  }
}


//----------- Constructors -----------//

Future<num> getAverageTemperatureAsync(DataProcessor<Day> processor) 
{
  print("⏳ Starting an asynchronous calculation of the average temperature...");
  
  return Future.delayed(Duration(seconds: 1), ()
   {
    if (processor.items.isEmpty)
    {
      throw Exception("The list of days is empty, it is not possible to calculate the average value.!");
    }
    num result = processor.average((d) => d.temperature);
    print("-> Average temperature calculation completed :)");
    return result;
  });
}


Future<Day?> getMaxTemperatureDayAsync(DataProcessor<Day> processor) 
{
  print("⚡️ We start the search for the day with the maximum temperature (instantly)...");
  
  Day? result = processor.maxBy((d) => d.temperature);
  print("-> Search for the day with the maximum temperature is complete!");
  return Future.value(result);
}


// Asynchronous function for sequential calling and processing of results
Future<void> processWeatherData(DataProcessor<Day> processor) async 
{
  print("\n--- Start of sequential processing of weather data ---");
  try 
  {
    // We sequentially call the first asynchronous function and wait for its result
    final averageTemp = await getAverageTemperatureAsync(processor);
    print("✅ Result: Average temperature = ${averageTemp.toStringAsFixed(2)}°C\n");

    // Call the second asynchronous function. It will execute after the first one
    final maxTempDay = await getMaxTemperatureDayAsync(processor);
    if (maxTempDay != null) {
      print("✅ Result: Day with maximum temperature: $maxTempDay\n");
    } else {
      print("⚠️ Could not find day with maximum temperature :(\n");
    }

  } 
  catch (e) 
  {
    print("\n❌ An error occurred during processing: $e");
  } 
  finally 
  {
    print("--- Completion of data processing ---");
  }
}

Future<void> main() async 
{
  List<Day> days = [
    Day(date: DateTime(2025, 8, 5), temperature: 19.1, comment: "Rain and strong wind"),
    Day(date: DateTime(2025, 8, 15), temperature: 23.1, comment: "A little cloudy and cold"),
    Day(date: DateTime(2025, 8, 30), temperature: 28.3, comment: "Clear sky and sunny")
  ];

  Weather weather = Weather(season: "Summer", comment: "Daily weather", days: days);
  var processor = DataProcessor<Day>(weather.days);
  
  await processWeatherData(processor);
  
  print("\n\n--- Demonstration of error handling with an empty list ---");
  var emptyProcessor = DataProcessor<Day>([]);
  await processWeatherData(emptyProcessor);
}
