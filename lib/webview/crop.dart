import 'package:crop/widgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Crop extends StatefulWidget {
  const Crop({Key? key}) : super(key: key);

  @override
  State<Crop> createState() => _CropState();
}

class _CropState extends State<Crop> {
  GetStorage box = GetStorage();

  @override
  void initState() {
    super.initState();
    getUrl();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getUrl() {
    if (box.read('crop') == 'Corn') {
      return 'https://www.hunker.com/13728343/how-to-grow-corn';
    } else if (box.read('crop') == 'Calabaza') {
      return 'https://www.hunker.com/13406992/how-to-grow-kalabasa-philippine-squash';
    } else {
      return 'https://www.hunker.com/13728271/how-to-grow-eggplant';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidet(
          text: 'Crop Management',
          fw: FontWeight.bold,
          color: Colors.white,
          fontSize: 18.0,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          content: const Text(
                            'Make sure you are connected to the Internet',
                            style: TextStyle(fontFamily: 'Quicksand'),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                              child: const Text(
                                'Close',
                                style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ));
              },
              icon: const Icon(
                Icons.info_outline_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: getUrl(),
      ),
    );
  }
}
