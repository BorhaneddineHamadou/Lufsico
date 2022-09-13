import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lufsico/home_page.dart';
import 'package:lufsico/record_page.dart';
import 'package:tflite/tflite.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras = [];
int cameraFace = 0;

class RecordPage extends StatefulWidget {
  const RecordPage({
    Key? key,
  }) : super(key: key);
  @override
  _RecordPageState createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  late List? _recognitions;
  late double? _imageHeight;
  late double? _imageWidth;
  CameraImage? img;
  late CameraController controller;
  bool isBusy = false;

  @override
  void initState() {
    super.initState();
    loadModel();
    initCamera();
  }

  @override
  void dispose() {
    super.dispose();
    controller.stopImageStream();
    Tflite.close();
  }

  Future loadModel() async {
    Tflite.close();
    try {
      String? res;
      res = await Tflite.loadModel(
          model: "assets/posenet_mv1_075_float_from_checkpoints.tflite",
          numThreads: 5
          //useGpuDelegate: true,
          );
      print(res);
    } on PlatformException {
      print('Tflite to load model.');
    }
  }

  initCamera() {
    controller = CameraController(
      cameras[cameraFace],
      ResolutionPreset.max,
      enableAudio: false,
    );

    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      //controller.startVideoRecording();

      setState(() {
        controller.startImageStream((image) => {
              if (!isBusy) {isBusy = true, img = image, runModelOnFrame()}
            });
      });
    });
  }

  runModelOnFrame() async {
    _imageWidth = img!.width + 0.0;
    _imageHeight = img!.height + 0.0;
    _recognitions = await Tflite.runPoseNetOnFrame(
          bytesList: img!.planes.map((plane) {
            return plane.bytes;
          }).toList(),
          imageHeight: img!.height,
          imageWidth: img!.width,
          numResults: 1,
        ) ??
        [];
    isBusy = false;
    setState(() {
      img;
    });
  }

  List<Widget> renderKeypoints(Size screen) {
    if (_recognitions == null) return [];
    if (_imageHeight == null || _imageWidth == null) return [];

    double? factorX = screen.width;
    double? factorY = _imageHeight;

    var lists = <Widget>[];
    _recognitions!.forEach((re) {
      var list = re["keypoints"].values.map<Widget>((k) {
        return Positioned(
          left: k["x"] * factorX,
          top: k["y"] * factorY,
          width: 100,
          height: 20,
          child: Text(
            "● ${k["part"]}",
            style: const TextStyle(
              color: Colors.red,
              fontSize: 12.0,
            ),
          ),
        );
      }).toList();

      lists.addAll(list);
    });

    return lists;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> stackChildren = [];

    stackChildren.add(Positioned(
        top: 0.0,
        left: 0.0,
        bottom: 0,
        width: size.width,
        child: Container(
          child: (!controller.value.isInitialized)
              ? Container()
              : AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: CameraPreview(controller),
                ),
        )));

    if (img != null) {
      stackChildren.addAll(renderKeypoints(size));
    }
    stackChildren.addAll([
      Positioned(
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: MediaQuery.of(context).viewPadding.top),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppBarAp(),
              Column(
                children: [
                  // GestureDetector(
                  //   onTap: () async {
                  //     var file = await controller.stopVideoRecording();
                  //     var len = await file.length();
                  //     print("len " + len.toString());
                  //     file.openRead();
                  //   },
                  //   child: CircleAvatar(
                  //     radius: 25,
                  //     child: Icon(
                  //       Icons.stop,
                  //     ),
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: () {
                      if (cameraFace == 0) {
                        cameraFace = 1;
                      } else {
                        cameraFace = 0;
                      }
                      initCamera();
                    },
                    child: const CircleAvatar(
                      radius: 25,
                      child: Icon(
                        Icons.camera,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const BottomBar(),
                ],
              ),
            ],
          ),
        ),
      )
    ]);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            color: Colors.black,
            child: Stack(
              children: stackChildren,
            )),
      ),
    );
  }
}
