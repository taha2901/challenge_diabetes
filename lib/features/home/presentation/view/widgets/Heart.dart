// import 'package:camera/camera.dart';
// import 'package:challenge_diabetes/features/home/data/heartmodel/heartmodel.dart';
// import 'package:flutter/material.dart';

// class Heart extends StatefulWidget {
//   const Heart({super.key});

//   @override
//   State<Heart> createState() => _HeartState();
// }

// class _HeartState extends State<Heart> {
//   bool _toggled = false;
//   bool _processing=false;
//   double _alpha = 0.3;
//   int _bpm = 0;
//   List<Sensorvalue> _data = [];
//    CameraController? _controller;

//   Future<void> _initController() async {
//     try {
//       List _cameras = await availableCameras();
//       _controller = CameraController(_cameras.first, ResolutionPreset.low);
//       await _controller?.initialize();
//       Future.delayed(const Duration(milliseconds: 500)).then((onValue) {
//         _controller?.setFlashMode(FlashMode.torch);
//       });
//       _controller?.startImageStream((CameraImage image) {
//         if (!_processing) {
//           setState(() {
//             _processing = true;
//           });
//           _scanImage(image);
//         }
//       });
//     } on Exception {
//       print(Exception);
//     }
//   }
//   _scanImage(CameraImage image) {
//     double _avg =
//         image.planes.first.bytes.reduce((value, element) => value + element) /
//             image.planes.first.bytes.length;
//     if (_data.length >= 50) {
//       _data.removeAt(0);
//     }
//     setState(() {
//       _data.add(Sensorvalue(DateTime.now(), _avg));
//     });
//     Future.delayed(const Duration(milliseconds: 1000 ~/ 30)).then((onValue) {
//       setState(() {
//         _processing = false;
//       });
//     });
//   }
//   _toggle() {
//     _initController().then((onValue) {
//       Wakelock.enable();
//       setState(() {
//         _toggled = true;
//         _processing = false;
//       });
//       _updateBPM();
//     });
//   }
//   _untoggle() {
//     _disposeController();
//     Wakelock.disable();
//     setState(() {
//       _toggled = false;
//       _processing = false;
//     });
//   }
//   _updateBPM() async {
//     List<Sensorvalue> _values;
//     double _avg;
//     int _n;
//     double _m;
//     double _threshold;
//     double calculatedBPM; // Use a different variable name here
//     int _counter;
//     int _previous;
//     while (_toggled) {
//       _values = List.from(_data);
//       _avg = 0;
//       _n = _values.length;
//       _m = 0;
//       _values.forEach((Sensorvalue value) {
//         _avg += value.value / _n;
//         if (value.value > _m) _m = value.value;
//       });
//       _threshold = (_m + _avg) / 2;
//       calculatedBPM = 0; // Initialize the local variable
//       _counter = 0;
//       _previous = 0;
//       for (int i = 1; i < _n; i++) {
//         if (_values[i - 1].value < _threshold &&
//             _values[i].value > _threshold) {
//           if (_previous != 0) {
//             _counter++;
//             calculatedBPM +=
//                 60000 / (_values[i].time.millisecondsSinceEpoch - _previous);
//           }
//           _previous = _values[i].time.millisecondsSinceEpoch;
//         }
//       }
//       if (_counter > 0) {
//         calculatedBPM = calculatedBPM / _counter;
//         setState(() {
//           _bpm = ((1 - _alpha) * calculatedBPM + _alpha * calculatedBPM).round();
//         });
//       }
//       await Future.delayed(Duration(milliseconds: (1000 * 50 / 30).round()));
//     }
//   }
//   _disposeController() {
//     if (_controller != null) {
//       _controller?.stopImageStream();
//       _controller?.dispose();
//       _controller=null;
//     }
//   }
//  @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: <Widget>[
//         Expanded(child: Row(
//           children: [
//             Expanded(
//               child: _controller == null
//                         ? Container() // or any placeholder widget
//                         : CameraPreview(_controller!)

//             ),
//             Expanded(
//               child: Center(
//                 child: Text(
//                   (_bpm > 30 && _bpm < 150 ? _bpm.round().toString() : "--"),
//                   style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ],
//         )),

//             Expanded(
//               child: Center(
//                 child: IconButton(
//                   icon: Icon(_toggled ? Icons.favorite : Icons.favorite_border),
//                   color: Colors.red,
//                   iconSize: 128,
//                   onPressed: () {
//                     if (_toggled) {
//                       _untoggle();
//                     } else {
//                       _toggle();
//                     }
//                   },
//                 ),
//               ),
//             ),

//           ],
//         ),
//       ),
//     );
//   }
// }
