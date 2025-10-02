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
  String toString() => "${date.toIso8601String()} | ${temperature}°C | $comment";
}

// Generic Class
class DataProcessor<T> 
{
  List<T> items;

  DataProcessor(this.items);

  // Average value of a numeric field
  num average<numT extends num>(numT Function(T) selector)
  {
    if (items.isEmpty) return 0;
    num sum = 0 as num;
    for (var item in items) 
    {
      sum += selector(item) as num;
    }
    return sum / items.length;
  }

  // Maximum element
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

  // Minimum element
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

void main() 
{
  List<Day> days = [
    Day(date: DateTime(2025, 8, 5), temperature: 19.1, comment: "Rain and strong wind"),
    Day(date: DateTime(2025, 8, 15), temperature: 23.1, comment: "A little cloudy and cold"),
    Day(date: DateTime(2025, 8, 30), temperature: 28.3, comment: "Clear sky and sunny") 
  ];

  Weather weather = Weather(season: "Summer", comment: "Daily weather", days: days);

  // Realization generic class
  var processor = DataProcessor<Day>(weather.days);

  print("Average temperature = ${processor.average((d) => d.temperature)}°C");
  print("Day with maximum temperature: ${processor.maxBy((d) => d.temperature)}");
  print("Day with longest comment: ${processor.maxBy((d) => d.comment.length)}");
  print("Day with earliest date: ${processor.minBy((d) => d.date)}");
}
