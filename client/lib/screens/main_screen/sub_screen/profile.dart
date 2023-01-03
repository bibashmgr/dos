import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// constants
import 'package:client/utils/constants.dart';

// services
import 'package:client/services/profile_service.dart';

// providers
import 'package:client/providers/user_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<ChartData> chartData = [
    ChartData('Incomplete', 70, Colors.red),
    ChartData('Complete', 20, Colors.green),
    ChartData('Total', 100, Colors.blue),
  ];

  ProfileService profileService = ProfileService();

  void getUserInfo() async {
    await profileService.getProfile('/users/profile', context);
  }

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 30.0,
          horizontal: 15.0,
        ),
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 125,
                    height: 125,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 4,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 0,
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, 4),
                        ),
                      ],
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/avatar.jpg'),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: kDarkColor,
                        ),
                        child: const Icon(
                          Icons.edit,
                          size: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Center(
              child: Text(
                Provider.of<UserProvider>(
                  context,
                ).userInfo.name,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: kDarkColor,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 15.0,
              ),
              decoration: BoxDecoration(
                color: kLightColor,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: SizedBox(
                width: double.maxFinite,
                height: 200,
                child: SfCircularChart(
                  margin: const EdgeInsets.symmetric(
                    vertical: 0.0,
                    horizontal: 0.0,
                  ),
                  legend: Legend(
                    isResponsive: true,
                    textStyle: const TextStyle(
                      color: kDarkColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                    ),
                    isVisible: true,
                    alignment: ChartAlignment.center,
                  ),
                  series: <CircularSeries>[
                    RadialBarSeries<ChartData, String>(
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      radius: '70%',
                      innerRadius: '40%',
                      gap: '15%',
                      maximumValue: 100,
                      cornerStyle: CornerStyle.bothCurve,
                      useSeriesColor: false,
                      trackOpacity: 0.8,
                      pointColorMapper: (ChartData data, _) => data.color,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
