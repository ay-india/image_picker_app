import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_app/image_picker_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePickerController controller = Get.put(ImagePickerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Image Picker'),
        ),
        body: Obx(() {
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Container(
                //   height: 300,
                //   width: 300,
                //   decoration: BoxDecoration(
                //     border: Border.all(),
                //     borderRadius: BorderRadius.circular(20),
                //     image: DecorationImage(image: controller.imagePath.isNotEmpty
                //       ? FileImage(
                //           File(
                //             controller.imagePath.toString(),
                //           ),
                //         )
                //       : null,),
                //   ),
                // ),
                CircleAvatar(
                  radius: 160,
                  backgroundImage: controller.imagePath.isNotEmpty
                      ? FileImage(
                          File(
                            controller.imagePath.toString(),
                          ),
                        )
                      : null,
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          controller.getImagefromCamera();
                        },
                        child: Text('Pick from Camera')),
                    TextButton(
                        onPressed: () {
                          controller.getImagefromGallery();
                        },
                        child: Text('Pick from Gallery'))
                  ],
                )
              ]);
        }));
  }
}
