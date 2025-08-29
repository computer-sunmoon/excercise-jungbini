import 'dart:nativewrappers/_internal/vm/bin/common_patch.dart';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

late List<CameraDescription> _cameras;

Future<void> main() async {
  // 1. Flutter 앱이 실행 될 준비가 됐는지 확인
  WidgetsFlutterBinding.ensureInitialized();

  // 2. 핸드폰에 있는 카메라들 가져오기
  _cameras = await availableCameras();

  runApp(const CameraApp());
}

class CameraApp extends StatefulWidget {
  const CameraApp({Key? key}) : super(key: key);

  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState() extends State<CameraApp> {
  // 3. 카메라를 제어할 수 있는 컨트롤러 선언
  late CameraController controller;

  void initState() {
    super.initState();

    initializeCamera();
  }

  initializeCamera() async {
    try {
      // 4. 가장 첫 번째 카메라로 카메라 설정하기
      controller = CameraController(_cameras[0], ResolutionPreset.max);

      // 5. 카메라 초기화
      await controller.initialize();

      setState(() { });
    }
  }
}