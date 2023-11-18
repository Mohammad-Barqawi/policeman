import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:flutter/material.dart';

class chartView extends StatelessWidget {
  final int kcal;
  const chartView({super.key, required this.kcal});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedCircularChart(
          key: GlobalKey<AnimatedCircularChartState>(),
          size: const Size(50, 50),
          initialChartData: <CircularStackEntry>[
            CircularStackEntry(
              <CircularSegmentEntry>[
                CircularSegmentEntry(
                  // 33.33,
                  (kcal / 10).toDouble(),
                  Colors.green,
                ),
                CircularSegmentEntry(
                  // 66.67,
                  (1000 - (kcal / 10)).toDouble(),
                  Colors.grey,
                ),
              ],
            ),
          ],
          chartType: CircularChartType.Radial,
          edgeStyle: SegmentEdgeStyle.round,
          percentageValues: true,
        ),
        Positioned(
            top: 13,
            left: 13,
            child: Column(
              children: [
                Text("$kcal",
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold)),
                const Text(
                  "Kcal",
                  style: TextStyle(fontSize: 7, color: Colors.grey),
                ),
              ],
            ))
      ],
    );
  }
}
