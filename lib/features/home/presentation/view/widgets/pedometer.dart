// import 'dart:io' show Platform;
// import 'package:flutter/material.dart';
// import 'dart:async';

// import 'package:pedometer/pedometer.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:device_info_plus/device_info_plus.dart';

// class pedoometer extends StatefulWidget {
//   const pedoometer({super.key});

//   @override
//   State<pedoometer> createState() => _pedoometerState();
// }

// class _pedoometerState extends State<pedoometer> {
//   late Stream<StepCount> _stepCountStream;
//   late Stream<PedestrianStatus> _pedestrianStatusStream;
//   String _status = '?', _steps = '?';
//   String formatDate(DateTime d) {
//     return d.toString().substring(0, 19);
//   }

//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }

//   void onStepCount(StepCount event) {
//     print(event);
//     setState(() {
//       _steps = event.steps.toString();
//     });
//   }

//   void onPedestrianStatusChanged(PedestrianStatus event) {
//     print(event);
//     setState(() {
//       _status = event.status;
//     });
//   }

//   void onPedestrianStatusError(error) {
//     print('onPedestrianStatusError: $error');
//     setState(() {
//       _status = 'Pedestrian Status not available';
//     });
//     print(_status);
//   }

//   void onStepCountError(error) {
//     print('onStepCountError: $error');
//     setState(
//       () {
//         _steps = 'Step Count not available';
//       },
//     );
//   }

//   Future<Permission> getMotionPermission() async {
//     if (Platform.isAndroid && (await getAndroidSdk())! >= 29)
//       return Permission.activityRecognition;
//     else
//       return Permission.sensors;
//   }

//   Future<int?> getAndroidSdk() async {
//     if (Platform.isAndroid) {
//       var androidInfo = await DeviceInfoPlugin().androidInfo;
//       var sdkInt = androidInfo.version.sdkInt;
//       return sdkInt;
//     }
//     return 0;
//   }

//   Future<void> initPlatformState() async {
//     Permission motionPermission = await getMotionPermission();
//     if (!await motionPermission.isGranted) {
//       var newStatus = await motionPermission.request();
//       if (!newStatus.isGranted) return Future.error('Permission not granted');
//     }
//     _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
//     _pedestrianStatusStream
//         .listen(onPedestrianStatusChanged)
//         .onError(onPedestrianStatusError);

//     _stepCountStream = Pedometer.stepCountStream;
//     _stepCountStream.listen(onStepCount).onError(onStepCountError);

//     if (!mounted) return;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // const Icon(FontAwesomeIcons.walking,size: 20,),
//             Text(
//               _steps,
//               style: const TextStyle(fontSize: 25),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
