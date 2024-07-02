import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final adviseController =
    StateNotifierProvider<AdviseProvider, Map<String, dynamic>>((ref) {
  return AdviseProvider();
});

class AdviseProvider extends StateNotifier<Map<String, dynamic>> {
  AdviseProvider() : super({});

  List<Map<String, String>> motivationalQuotes = [
    {
      "text":
          "Success is no accident. It is hard work, perseverance, learning, studying, sacrifice and most of all, love of what you are doing or learning to do.",
      "author": "Pelé"
    },
    {
      "text":
          "There are no secrets to success. It is the result of preparation, hard work, and learning from failure.",
      "author": "Colin Powell"
    },
    {
      "text":
          "The difference between try and triumph is just a little umph! Keep pushing yourself, because no one else is going to do it for you.",
      "author": "Unknown"
    },
    {
      "text":
          "Success usually comes to those who are too busy to be looking for it. The road to success is dotted with many tempting parking spaces.",
      "author": "Henry David Thoreau"
    },
    {
      "text":
          "Don’t watch the clock; do what it does. Keep going. Your effort is never wasted, even when it leads to disappointing results. Because it always makes you stronger, more experienced, and wiser.",
      "author": "Sam Levenson"
    },
    {
      "text":
          "Hard work beats talent when talent doesn’t work hard. It’s not about being the best. It’s about being better than you were yesterday.",
      "author": "Tim Notke"
    },
    {
      "text":
          "The only place where success comes before work is in the dictionary. Keep grinding, because no one else is going to do it for you.",
      "author": "Vidal Sassoon"
    },
    {
      "text":
          "Dreams don’t work unless you do. The key to success is to focus on goals, not obstacles. Keep moving forward, no matter what.",
      "author": "John C. Maxwell"
    },
    {
      "text":
          "Success is not final, failure is not fatal: It is the courage to continue that counts. The more you sweat in practice, the less you bleed in battle.",
      "author": "Winston Churchill"
    },
    {
      "text":
          "The only limit to our realization of tomorrow will be our doubts of today. Push yourself, because no one else is going to do it for you.",
      "author": "Franklin D. Roosevelt"
    },
    {
      "text":
          "Success is the sum of small efforts, repeated day in and day out. It’s the work you put in when no one is watching that defines you.",
      "author": "Robert Collier"
    },
    {
      "text":
          "You don’t have to be great to start, but you have to start to be great. Each step you take is a step closer to achieving your goals.",
      "author": "Zig Ziglar"
    },
    {
      "text":
          "The future belongs to those who believe in the beauty of their dreams. It’s not enough to have a dream, you must be willing to work for it.",
      "author": "Eleanor Roosevelt"
    },
    {
      "text":
          "The harder you work for something, the greater you’ll feel when you achieve it. It’s the journey that shapes you into the person you need to become.",
      "author": "Unknown"
    },
    {
      "text":
          "Don’t wish it were easier; wish you were better. The harder you work, the luckier you get.",
      "author": "Jim Rohn"
    },
    {
      "text":
          "Your time is limited, so don’t waste it living someone else’s life. Don’t be trapped by dogma – which is living with the results of other people’s thinking.",
      "author": "Steve Jobs"
    },
    {
      "text":
          "Strive not to be a success, but rather to be of value. The best way to predict the future is to create it.",
      "author": "Albert Einstein"
    },
    {
      "text":
          "It always seems impossible until it’s done. Hard work spotlights the character of people: some turn up their sleeves, some turn up their noses, and some don’t turn up at all.",
      "author": "Nelson Mandela"
    },
    {
      "text":
          "The secret of getting ahead is getting started. The only way to do great work is to love what you do.",
      "author": "Mark Twain"
    },
    {
      "text":
          "Don’t let yesterday take up too much of today. The man who moves a mountain begins by carrying away small stones.",
      "author": "Confucius"
    },
  ];

  void init() async {
    DateTime now = DateTime.now();
    int dayOfYear = int.parse(DateFormat("D").format(now));
    int quoteIndex = dayOfYear % motivationalQuotes.length;
    state = motivationalQuotes[quoteIndex];
  }
}
