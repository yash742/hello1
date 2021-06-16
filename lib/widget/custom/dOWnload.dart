import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class DownLding extends StatefulWidget {
  @override
  _DownLdingState createState() => _DownLdingState();
}

class _DownLdingState extends State<DownLding> {
  final Dio dio = Dio();
  bool isloading = false;
  double progress = 0.0;
  Future<bool> savefile(String url, String filenme) async {
    Directory directory;
    try {
      if (Platform.isAndroid) {
        if (await _permissionrequest(Permission.storage)) {
          directory =
              await getExternalStorageDirectory(); //give the temprory dir path
          print(directory);
        } else {
          //PERMISSION FOR IOS PHOTOSlibrary
          if (await _permissionrequest(Permission.photos)) {
            directory = await getTemporaryDirectory();
            print("IOS.....");
          } else {
            return false;
          }
        }
        if (await directory.exists()) {
          await directory.create(
              recursive: true); //how to check wether it created or not
        }
        if (await directory.exists()) {
          File savedviedio = File(directory.path + "/$filenme");
          await dio.download(url, savedviedio.path,
              onReceiveProgress: (count, totalsize) {
            setState(() {
              progress = count /
                  totalsize; //give the value of progress range b/w 0 and 1
            });
          });
          if(Platform.isIOS)
          return true;
        }
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<bool> _permissionrequest(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var resl = await permission.request();
      if (resl == permission.isGranted) {
        return true;
      } else {
        return false;
      }
    }
  }

  void downld() async {
    setState(() {
      isloading = true;
    });
    bool downladed = await savefile("", "");
    if (downladed) {
    } else {}
    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: isloading
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 10.0,
                    ),
                  )
                : FlatButton(
                    onPressed: downld,
                    child: Text(
                      "Download viedio",
                      style: TextStyle(fontSize: 23.0, color: Colors.white),
                    ),
                    color: Colors.blue,
                    padding: const EdgeInsets.all(10.0),
                  )));
  }
}
