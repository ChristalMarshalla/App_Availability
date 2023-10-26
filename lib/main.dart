import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  Future<void> checkAppIsInstalled() async {
    bool isInstalled = await DeviceApps.isAppInstalled('com.example.demo');
    if (isInstalled) {
      print('The app is installed and enabled.');
    } else {
      print('The app is not installed or not enabled.');
    }
  }

  Future<void> launchApp() async {
    await DeviceApps.openApp('com.example.demo');
  }

  Future<void> getListOfInstalledApps() async {
    List<Application> apps = await DeviceApps.getInstalledApplications(
      includeAppIcons: true,
      onlyAppsWithLaunchIntent: true,
    );

    for (var app in apps) {
      print('App Name: ${app.appName}');
      print('Package Name: ${app.packageName}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Operations Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: checkAppIsInstalled,
              child: Text('Check if App is Installed'),
            ),
            ElevatedButton(
              onPressed: launchApp,
              child: Text('Launch App'),
            ),
            ElevatedButton(
              onPressed: getListOfInstalledApps,
              child: Text('List Installed Apps'),
            ),
          ],
        ),
      ),
    );
  }
}
