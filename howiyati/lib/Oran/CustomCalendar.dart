import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatelessWidget {
  
  final List<DateTime> highlightedDays = [
    DateTime(2024, 12, 1),
    DateTime(2024, 12, 5),
    DateTime(2024, 12, 10),
    DateTime(2024, 12, 15),
    DateTime(2024, 12, 25),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 25),
          child: Text('التقويم',  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25,),
            Align(
              alignment: Alignment.center,
              child: Text(
                'جانفي 2024',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 25,),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7, 
                childAspectRatio: 1.0, 
              ),
              itemCount: 35, // 35 cells (5 weeks)
              itemBuilder: (context, index) {
                // Calculate the date for each cell
                DateTime date = DateTime(2024, 12, 1).add(Duration(days: index));
                bool isHighlighted =
                    highlightedDays.any((d) => d.year == date.year && d.month == date.month && d.day == date.day);
                bool isToday = date.year == DateTime.now().year && date.month == DateTime.now().month && date.day == DateTime.now().day;

                return GestureDetector(
                  onTap: () {
                    // Handle tap on a day (you can show more info, etc.)
                    print('Tapped on ${date.toLocal()}');
                  },
                  child: Container(
                    margin: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: isHighlighted ? Colors.blue : (isToday ? Colors.orange : Colors.transparent),
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Center(
                      child: Text(
                        '${date.day}',
                        style: TextStyle(
                          color: isHighlighted || isToday ? Colors.white : Colors.black,
                          fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
         SizedBox(height: 50,),
         Image.asset("assets/oran/frameTime.png")
          ],
        ),
      ),
    );
  }
}