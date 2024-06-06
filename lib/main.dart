import 'package:flutter/material.dart';
import 'package:weather_forecast/base/color/appcolor.dart';
import 'package:weather_forecast/base/routes/approute.dart';
import 'package:weather_forecast/base/service/location_service/location_access.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocationAccess locationAccess = LocationAccess();
  await locationAccess.determinePosition();
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter().ongenerateRoute,
      theme: ThemeData(
        textTheme: TextTheme(
            bodyLarge: TextStyle(color: AppColor.textColor, fontSize: 22),
            bodySmall: TextStyle(color: AppColor.textColor),
            displayLarge: TextStyle(color: AppColor.textColor),
            bodyMedium: TextStyle(color: AppColor.textColor),
            titleLarge: TextStyle(
              color: AppColor.textColor,
              fontSize: 107,
              fontWeight: FontWeight.w100,
            ),
            titleMedium: TextStyle(
              color: AppColor.textColor,
              fontSize: 37,
            ),
            titleSmall: TextStyle(color: AppColor.textColor, fontSize: 24)),
      ),
    );
  }
}
