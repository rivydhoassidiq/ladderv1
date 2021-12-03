import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50,
        child: LoadingIndicator(
            indicatorType: Indicator.ballPulseSync,
            colors: const [
              Colors.red,
              Colors.green,
              Colors.blue,
              Colors.yellow,
              Colors.purple
            ],

            /// Optional, The color collections
            strokeWidth: 2,

            /// Optional, The stroke of the line, only applicable to widget which contains line
            backgroundColor: Colors.white,

            /// Optional, Background of the widget
            pathBackgroundColor: Colors.white

            /// Optional, the stroke backgroundColor
            ),
      ),
    );
  }
}
