import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  _onTap(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(),
              body: widget,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bezier Chart Sample"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            title: Text("Sample 1"),
            subtitle: Text("Number Chart"),
            onTap: () => _onTap(
                  context,
                  sample1(context),
                ),
          ),
          ListTile(
            title: Text("Sample 2"),
            subtitle: Text("Number Chart/ 2 curves"),
            onTap: () => _onTap(
                  context,
                  sample2(context),
                ),
          ),
          ListTile(
            title: Text("Sample 2"),
            subtitle: Text("Weekly Chart"),
            onTap: () => _onTap(
                  context,
                  sample3(context),
                ),
          ),
          ListTile(
            title: Text("Sample 3"),
            subtitle: Text("Montly Chart"),
            onTap: () => _onTap(
                  context,
                  sample4(context),
                ),
          ),
          ListTile(
            title: Text("Sample 4"),
            subtitle: Text("Yearly Chart"),
            onTap: () => _onTap(
                  context,
                  sample5(context),
                ),
          ),
        ],
      ),
    );
  }
}

//SAMPLE CUSTOM VALUES
Widget sample1(BuildContext context) {
  return Center(
    child: Container(
      color: Colors.red,
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width * 0.9,
      child: BezierLineChart(
        bezierLineChartScale: BezierLineChartScale.CUSTOM,
        xAxisCustomValues: const [0, 5, 10, 15, 20, 25, 30, 35],
        series: const [
          BezierLine(
            data: const [
              DataPoint<double>(value: 10, xAxis: 0),
              DataPoint<double>(value: 130, xAxis: 5),
              DataPoint<double>(value: 50, xAxis: 10),
              DataPoint<double>(value: 150, xAxis: 15),
              DataPoint<double>(value: 75, xAxis: 20),
              DataPoint<double>(value: 0, xAxis: 25),
              DataPoint<double>(value: 5, xAxis: 30),
              DataPoint<double>(value: 45, xAxis: 35),
            ],
          ),
        ],
        config: BezierLineChartConfig(
          verticalIndicatorStrokeWidth: 3.0,
          verticalIndicatorColor: Colors.black26,
          showVerticalIndicator: true,
          backgroundColor: Colors.red,
          snap: false,
        ),
      ),
    ),
  );
}

Widget sample2(BuildContext context) {
  return Container(
    color: Colors.red,
    height: MediaQuery.of(context).size.height / 2,
    width: MediaQuery.of(context).size.width,
    child: BezierLineChart(
      bezierLineChartScale: BezierLineChartScale.CUSTOM,
      xAxisCustomValues: const [0, 3, 10, 15, 20, 25, 30, 35],
      series: const [
        BezierLine(
          label: "Custom 1",
          data: const [
            DataPoint<double>(value: 10, xAxis: 0),
            DataPoint<double>(value: 130, xAxis: 5),
            DataPoint<double>(value: 50, xAxis: 10),
            DataPoint<double>(value: 150, xAxis: 15),
            DataPoint<double>(value: 75, xAxis: 20),
            DataPoint<double>(value: 0, xAxis: 25),
            DataPoint<double>(value: 5, xAxis: 30),
            DataPoint<double>(value: 45, xAxis: 35),
          ],
        ),
        BezierLine(
          lineColor: Colors.blue,
          lineStrokeWidth: 2.0,
          label: "Custom 2",
          data: const [
            DataPoint<double>(value: 5, xAxis: 0),
            DataPoint<double>(value: 50, xAxis: 5),
            DataPoint<double>(value: 30, xAxis: 10),
            DataPoint<double>(value: 30, xAxis: 15),
            DataPoint<double>(value: 50, xAxis: 20),
            DataPoint<double>(value: 40, xAxis: 25),
            DataPoint<double>(value: 10, xAxis: 30),
            DataPoint<double>(value: 30, xAxis: 35),
          ],
        ),
      ],
      config: BezierLineChartConfig(
        verticalIndicatorStrokeWidth: 2.0,
        verticalIndicatorColor: Colors.black12,
        showVerticalIndicator: true,
        contentWidth: MediaQuery.of(context).size.width * 2,
        backgroundColor: Colors.red,
      ),
    ),
  );
}

//SAMPLE DATE - WEEKLY

Widget sample3(BuildContext context) {
  final fromDate = DateTime(2019, 05, 22);
  final toDate = DateTime.now();

  final date1 = DateTime.now().subtract(Duration(days: 2));
  final date2 = DateTime.now().subtract(Duration(days: 3));

  return Container(
    color: Colors.red,
    height: MediaQuery.of(context).size.height / 2,
    width: MediaQuery.of(context).size.width,
    child: BezierLineChart(
      fromDate: fromDate,
      bezierLineChartScale: BezierLineChartScale.WEEKLY,
      toDate: toDate,
      selectedDate: toDate,
      series: [
        BezierLine(
          label: "Duty",
          onMissingValue: (dateTime) {
            if (dateTime.day.isEven) {
              return 10.0;
            }
            return 5.0;
          },
          data: [
            DataPoint<DateTime>(value: 10, xAxis: date1),
            DataPoint<DateTime>(value: 50, xAxis: date2),
          ],
        ),
      ],
      config: BezierLineChartConfig(
        verticalIndicatorStrokeWidth: 3.0,
        verticalIndicatorColor: Colors.black26,
        showVerticalIndicator: true,
        verticalIndicatorFixedPosition: false,
        backgroundColor: Colors.red,
        footerHeight: 30.0,
      ),
    ),
  );
}

//SAMPLE DATE - MONTHLY

Widget sample4(BuildContext context) {
  final fromDate = DateTime(2018, 11, 22);
  final toDate = DateTime.now();

  final date1 = DateTime.now().subtract(Duration(days: 2));
  final date2 = DateTime.now().subtract(Duration(days: 3));

  final date3 = DateTime.now().subtract(Duration(days: 35));
  final date4 = DateTime.now().subtract(Duration(days: 36));

  final date5 = DateTime.now().subtract(Duration(days: 65));
  final date6 = DateTime.now().subtract(Duration(days: 64));

  return Container(
    color: Colors.red,
    height: MediaQuery.of(context).size.height / 2,
    width: MediaQuery.of(context).size.width,
    child: BezierLineChart(
      bezierLineChartScale: BezierLineChartScale.MONTHLY,
      fromDate: fromDate,
      toDate: toDate,
      selectedDate: toDate,
      series: [
        BezierLine(
          label: "Duty",
          onMissingValue: (dateTime) {
            if (dateTime.month.isEven) {
              return 10.0;
            }
            return 5.0;
          },
          data: [
            DataPoint<DateTime>(value: 10, xAxis: date1),
            DataPoint<DateTime>(value: 50, xAxis: date2),
            DataPoint<DateTime>(value: 20, xAxis: date3),
            DataPoint<DateTime>(value: 80, xAxis: date4),
            DataPoint<DateTime>(value: 14, xAxis: date5),
            DataPoint<DateTime>(value: 30, xAxis: date6),
          ],
        ),
      ],
      config: BezierLineChartConfig(
        verticalIndicatorStrokeWidth: 3.0,
        verticalIndicatorColor: Colors.black26,
        showVerticalIndicator: true,
        verticalIndicatorFixedPosition: false,
        backgroundColor: Colors.red,
        footerHeight: 30.0,
      ),
    ),
  );
}

//SAMPLE DATE - YEARLY

Widget sample5(BuildContext context) {
  final fromDate = DateTime(2012, 11, 22);
  final toDate = DateTime.now();

  final date1 = DateTime.now().subtract(Duration(days: 2));
  final date2 = DateTime.now().subtract(Duration(days: 3));

  final date3 = DateTime.now().subtract(Duration(days: 300));
  final date4 = DateTime.now().subtract(Duration(days: 320));

  final date5 = DateTime.now().subtract(Duration(days: 650));
  final date6 = DateTime.now().subtract(Duration(days: 652));

  return Container(
    color: Colors.red,
    height: MediaQuery.of(context).size.height / 2,
    width: MediaQuery.of(context).size.width,
    child: BezierLineChart(
      bezierLineChartScale: BezierLineChartScale.WEEKLY,
      fromDate: fromDate,
      toDate: toDate,
      selectedDate: toDate,
      series: [
        BezierLine(
          label: "Duty",
          onMissingValue: (dateTime) {
            if (dateTime.year.isEven) {
              return 20.0;
            }
            return 5.0;
          },
          data: [
            DataPoint<DateTime>(value: 10, xAxis: date1),
            DataPoint<DateTime>(value: 50, xAxis: date2),
            DataPoint<DateTime>(value: 100, xAxis: date3),
            DataPoint<DateTime>(value: 100, xAxis: date4),
            DataPoint<DateTime>(value: 40, xAxis: date5),
            DataPoint<DateTime>(value: 47, xAxis: date6),
          ],
        ),
      ],
      config: BezierLineChartConfig(
        verticalIndicatorStrokeWidth: 3.0,
        verticalIndicatorColor: Colors.black26,
        showVerticalIndicator: true,
        verticalIndicatorFixedPosition: false,
        backgroundGradient: LinearGradient(
          colors: [
            Colors.red[300],
            Colors.red[400],
            Colors.red[400],
            Colors.red[500],
            Colors.red,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        footerHeight: 30.0,
      ),
    ),
  );
}
