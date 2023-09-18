
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:doctor_help_app/widgets/view_picture.dart';
import 'package:flutter/material.dart';

import 'button_Camera.dart';

late List<CameraDescription> cameras;
late CameraController _cameraController;
int direction = 0;

Image? capturedImage;

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});
  static String routeName ="CameraScreen";

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  late Future<void> _initialControllerFuture;

  @override
  void initState(){

    super.initState();
    _initialControllerFuture = startCamera(0);
  }

  Future<void> startCamera(int direction) async {
    cameras = await availableCameras();

    _cameraController = CameraController(
        cameras[direction],
        ResolutionPreset.max,
        enableAudio: false);

    await _cameraController.initialize().then((value) {
      if(!mounted){
        print("Mounted");
        _cameraController.dispose();
      }
      setState(() {});
    }).catchError((e){
      print(e);
    });
  }

  @override
  void dispose(){
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        body: FutureBuilder<void>(
          future: _initialControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return camera();
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      );
    } catch (e) {
      return const SizedBox();
    }
  }


  String? _capturedImagePath ="";
  Widget camera(){
    if (!_cameraController.value.isInitialized) {
      return Center(child: CircularProgressIndicator()); // Loading indicator
    }
    return SafeArea(
      child: Stack(
        children: [
          CameraPreview(_cameraController),
          GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: button(Icons.arrow_back_ios_new_outlined, Alignment.topLeft, false, Colors.transparent, Colors.white)),
          GestureDetector(
              onTap: (){
              },
              child: button(Icons.image_outlined, Alignment.bottomLeft, true, Colors.white, Colors.black54)),
          GestureDetector(
              onTap: (){
                _cameraController.takePicture().then((XFile? file){
                  if(mounted){
                    if(file!=null){
                      setState(() {
                        _capturedImagePath = file.path; // Lưu đường dẫn ảnh đã chụp
                      });
                      print("Picture save to ${file.path}");
                      Navigator.of(context).pushNamed(
                        ViewPicture.routeName,
                        arguments: _capturedImagePath,
                      );
                    }
                  }
                });

              },
              child: button(Icons.camera_alt_outlined, Alignment.bottomCenter,true, Colors.white, Colors.black54)),
          GestureDetector(
              onTap: (){
                setState(() {
                  direction =direction == 0?1:0;
                  startCamera(direction);
                });
              },
              child: button(Icons.flip_camera_ios_outlined, Alignment.bottomRight,true, Colors.white, Colors.black54)),
        ],
      ),
    );
  }



}
