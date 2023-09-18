import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

late List<CameraDescription> cameras;
late CameraController _cameraController;

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
    startCamera();
    super.initState();
  }

  void startCamera() async {
    cameras = await availableCameras();

    _cameraController = CameraController(
        cameras[0],
        ResolutionPreset.max,
        enableAudio: false);

    await _cameraController.initialize().then((value) {
      if(!mounted){
        print("Mounted");
        return;
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
    try{
      return Scaffold(
        body: Stack(
          children: [
            CameraPreview(_cameraController),
            button(Icons.image_outlined, Alignment.bottomLeft),
            button(Icons.camera_alt_outlined, Alignment.bottomCenter),
            button(Icons.flip_camera_ios_outlined, Alignment.bottomRight),
          ],
        ),
      );
    }
    catch(e)
      {
        return const SizedBox();
      }
  }

  Widget button(
      IconData icon,
      Alignment alignment,
      ){
    return Align(
      alignment: alignment,
      child: Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),
        height: 75,
        width: 75,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2,2),
              blurRadius: 10,
            )
          ],
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }


}
