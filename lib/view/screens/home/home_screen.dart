import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final textColor = isDark ? Colors.white : Colors.black87;
    final subTextColor = isDark ? Colors.white70 : Colors.black54;
    final cardColor = isDark
        ? Colors.white.withOpacity(0.05)
        : Colors.black.withOpacity(0.05);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.location_on,
            color: isDark ? AppColors.accentCyan : Colors.blue,
          ),
          onPressed: () {},
        ),
        title: Text(
          'Minya, Egypt',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: textColor,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: textColor),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark
                ? [AppColors.primaryNavy, AppColors.secondaryNavy]
                : [Colors.blue.shade200, Colors.blue.shade50],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Wed, 14 April 2026',
                  style: TextStyle(color: subTextColor, fontSize: 16),
                ),
                const SizedBox(height: 20),
                Icon(
                  Icons.wb_cloudy,
                  size: 100,
                  color: isDark ? Colors.white : Colors.blueGrey,
                ),
                const SizedBox(height: 10),
                Text(
                  '28°C',
                  style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                Text(
                  'Partly Cloudy',
                  style: TextStyle(
                    fontSize: 24,
                    color: isDark ? AppColors.accentCyan : Colors.blue.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 30),

                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isDark
                          ? Colors.white.withOpacity(0.1)
                          : Colors.black.withOpacity(0.05),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _WeatherDetailColumn(
                        icon: Icons.water_drop,
                        label: 'Humidity',
                        value: '45%',
                        textColor: textColor,
                        subTextColor: subTextColor,
                        isDark: isDark,
                      ),
                      _WeatherDetailColumn(
                        icon: Icons.air,
                        label: 'Wind',
                        value: '12 km/h',
                        textColor: textColor,
                        subTextColor: subTextColor,
                        isDark: isDark,
                      ),
                      _WeatherDetailColumn(
                        icon: Icons.compress,
                        label: 'Pressure',
                        value: '1012 hPa',
                        textColor: textColor,
                        subTextColor: subTextColor,
                        isDark: isDark,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return _HourlyWeatherCard(
                        time: '${12 + index}:00',
                        temp: '${28 - index}°',
                        icon: index % 2 == 0 ? Icons.wb_sunny : Icons.cloud,
                        textColor: textColor,
                        subTextColor: subTextColor,
                        cardColor: cardColor,
                        isDark: isDark,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Next 7 Days',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 7,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return _DailyWeatherTile(
                      day: 'Day ${index + 1}',
                      minTemp: '18°',
                      maxTemp: '${30 - index}°',
                      icon: Icons.sunny_snowing,
                      textColor: textColor,
                      subTextColor: subTextColor,
                      isDark: isDark,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _WeatherDetailColumn extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color textColor;
  final Color subTextColor;
  final bool isDark;

  const _WeatherDetailColumn({
    required this.icon,
    required this.label,
    required this.value,
    required this.textColor,
    required this.subTextColor,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: isDark ? AppColors.accentCyan : Colors.blue.shade700,
          size: 28,
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: subTextColor, fontSize: 12)),
      ],
    );
  }
}

class _HourlyWeatherCard extends StatelessWidget {
  final String time;
  final String temp;
  final IconData icon;
  final Color textColor;
  final Color subTextColor;
  final Color cardColor;
  final bool isDark;

  const _HourlyWeatherCard({
    required this.time,
    required this.temp,
    required this.icon,
    required this.textColor,
    required this.subTextColor,
    required this.cardColor,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark
              ? Colors.white.withOpacity(0.1)
              : Colors.black.withOpacity(0.05),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time, style: TextStyle(color: subTextColor)),
          const SizedBox(height: 10),
          Icon(icon, color: isDark ? Colors.yellow : Colors.orange, size: 30),
          const SizedBox(height: 10),
          Text(
            temp,
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _DailyWeatherTile extends StatelessWidget {
  final String day;
  final String minTemp;
  final String maxTemp;
  final IconData icon;
  final Color textColor;
  final Color subTextColor;
  final bool isDark;

  const _DailyWeatherTile({
    required this.day,
    required this.minTemp,
    required this.maxTemp,
    required this.icon,
    required this.textColor,
    required this.subTextColor,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 80,
            child: Text(day, style: TextStyle(color: textColor, fontSize: 16)),
          ),
          Icon(
            icon,
            color: isDark ? Colors.white70 : Colors.blueGrey,
            size: 28,
          ),
          SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  minTemp,
                  style: TextStyle(color: subTextColor, fontSize: 16),
                ),
                const SizedBox(width: 10),
                Text(
                  maxTemp,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
