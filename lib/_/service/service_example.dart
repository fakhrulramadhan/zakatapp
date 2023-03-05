//#GROUP_TEMPLATE experimental_service
import 'dart:io';
import 'package:example/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class ServiceExampleView extends StatelessWidget {
  const ServiceExampleView({Key? key}) : super(key: key);

  listener() {
    ScrollController scrollController = ScrollController();
    /*
    //#TEMPLATE get_scroll_listener
    scrollController.addListener(() {
      var offset = scrollController.offset;
      var maxScroll = scrollController.position.maxScrollExtent;
      if (offset == maxScroll) {
        setState(() {});
      } else {
        setState(() {});
      }
    });
    //#END
    */
  }

  getTemporaryDir() async {
    //#TEMPLATE get_temporary_dir
    var path = await getTemporaryDirectory();
    //#END
  }

  hive() async {
    //#TEMPLATE hive_init
    if (!kIsWeb) {
      var path = await getTemporaryDirectory();
      Hive.init(path.path);
    }
    mainStorage = await Hive.openBox('mainStorage');
    //#END

    //#TEMPLATE hive_write
    await mainStorage.put("mode", "legacy");
    //#END

    //#TEMPLATE hive_get
    var value = await mainStorage.get("mode");
    //#END
  }

  getLocation() async {
    //#TEMPLATE get_location
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();
    //#END
  }

  // doUploadToImgBB() async {
  //   {
  //     //#TEMPLATE get_image_with_file_picker
  //     FilePickerResult? result = await FilePicker.platform.pickFiles(
  //       type: FileType.custom,
  //       allowedExtensions: [
  //         "png",
  //         "jpg",
  //       ],
  //       allowMultiple: false,
  //     );
  //     if (result == null) return;
  //     File file = File(result.files.single.path!);
  //     String filePath = file.path;
  //     //#END
  //   }
  //   {
  //     //#TEMPLATE get_image_gallery
  //     XFile? image = await ImagePicker().pickImage(
  //       source: ImageSource.gallery,
  //       imageQuality: 40,
  //     );
  //     String? filePath = image?.path;
  //     //#END
  //   }
  //   {
  //     //#TEMPLATE get_image_camera
  //     XFile? image = await ImagePicker().pickImage(
  //       source: ImageSource.camera,
  //       imageQuality: 40,
  //     );
  //     String? filePath = image?.path;
  //     //#END
  //   }
  //   {
  //     //#TEMPLATE get_video_gallery
  //     XFile? image = await ImagePicker().pickVideo(
  //       source: ImageSource.gallery,
  //     );
  //     String? filePath = image?.path;
  //     //#END
  //   }
  //   {
  //     //#TEMPLATE get_video_camera
  //     XFile? image = await ImagePicker().pickVideo(
  //       source: ImageSource.camera,
  //     );
  //     String? filePath = image?.path;
  //     //#END
  //   }
  //   {
  //     //#TEMPLATE get_permission
  //     if (await Permission.storage.request().isGranted) {}
  //     //#END

  //     //#TEMPLATE get_permission_and_open_app_settings_if_denied
  //     if (await Permission.storage.request().isGranted) {
  //       //isGranted!
  //     } else if (await Permission.storage.isPermanentlyDenied) {
  //       openAppSettings();
  //     }
  //     //#END
  //   }
  // }

  void httpRequestExample() async {
    //#TEMPLATE do_upload_file_dio
    String filePath = "";
    final formData = FormData.fromMap({
      'image': MultipartFile.fromBytes(
        File(filePath).readAsBytesSync(),
        filename: "upload.jpg",
      ),
    });

    var res = await Dio().post(
      'https://api.imgbb.com/1/upload?key=b55ef3fd02b80ab180f284e479acd7c4',
      data: formData,
    );

    var data = res.data["data"];
    var url = data["url"];
    //#END
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [
              Text(
                "Hello World",
                style: TextStyle(),
              ),
              Text(
                "Test",
                style: TextStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
