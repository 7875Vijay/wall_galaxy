import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class FullScreen extends StatefulWidget {
  String url;
  FullScreen({super.key, required this.url});

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  Future<void> saveImageToGallery(BuildContext context, String imageUrl) async {
    // Show SnackBar for saving progress
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Saving image...', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.grey,
      ),
    );

    // Fetch the image data from URL
    var response = await http.get(Uri.parse(imageUrl));

    if (response.statusCode == 200) {
      Uint8List imageBytes = response.bodyBytes;

      // Save image to the Pictures directory (for Android 9 and below)
      var random = Random();
      var randomeNumber = random.nextInt(9999);
      String path =
          '/storage/emulated/0/Pictures/wallgalaxy$randomeNumber.jpg'; // Default path for external storage
      File file = File(path);

      try {
        // Write the image bytes to the file
        await file.writeAsBytes(imageBytes);

        // Show success SnackBar
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Image saved to gallery', style: TextStyle(fontFamily: 'MYPPR',),),
            backgroundColor: Colors.green,
          ),
        );
      } catch (e) {
        // Show error SnackBar if something goes wrong
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to save image',style: TextStyle(fontFamily: 'MYPPR',)),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      // Show error SnackBar if image fetch fails
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to fetch image',style: TextStyle(fontFamily: 'MYPPR',)),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
        onPressed: () async {
          try {
            saveImageToGallery(context, widget.url);
          } on PlatformException {
            const SnackBar(
              content: Text('Error while saving the image..',
                  style: TextStyle(color: Colors.white, fontFamily: 'MYPPR',)),
              backgroundColor: Colors.red,
            );
          }
        },
        child: const Icon(Icons.download,
            color: Color.fromARGB(255, 233, 196, 12)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Image.network(widget.url,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover),
              Positioned(
                  top: 20,
                  left: 10,
                  child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Center(
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back,
                                  color: Color.fromARGB(255, 233, 196, 12))))))
            ],
          )),
    );
  }
}
