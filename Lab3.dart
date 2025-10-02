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

  double avgTemperature() 
  {
    if (days.isEmpty) return 0;
    double sum = 0;
    for (var day in days) 
    {
      sum += day.temperature;
    }
    return sum / days.length;
  }

  Day? maxTemperature() 
  {
    if (days.isEmpty) return null;
    days.sort((a, b) => b.temperature.compareTo(a.temperature));
    return days.first;
  }

  Day? longestComment() 
  {
    if (days.isEmpty) return null;
    days.sort((a, b) => b.comment.length.compareTo(a.comment.length));
    return days.first;
  }
}

void main()
 {

  List<Day> days = [
    Day(date: DateTime(2025, 8, 5), temperature: 28.3, comment: "Clear sky and sunny"),
    Day(date: DateTime(2025, 8, 15), temperature: 23.1, comment: "A little cloudy and cold"),
    Day(date: DateTime(2025, 8, 30), temperature: 19.1, comment: "Rain and strong wind")
  ];

  Weather weather = Weather(season: "Summer", comment: "Daily weather", days: days);

  print("Average temperature = ${weather.avgTemperature()}°C");
  print("Day with maximum temperature: ${weather.maxTemperature()?.date.toIso8601String()} = ${weather.maxTemperature()?.temperature}°C");
  print("Day with the longest comment: ${weather.longestComment()?.date.toIso8601String()} - ${weather.longestComment()?.comment}");
}