import 'package:crop/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/textWidget.dart';

class HotlinePage extends StatelessWidget {
  const HotlinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: TextWidet(
          text: 'Hotlines',
          fw: FontWeight.bold,
          color: Colors.white,
          fontSize: 22.0,
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                tileColor: Colors.white,
                leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.phone),
                ),
                title: TextWidet(
                  text: '+6390-9010-4355',
                  fw: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 22.0,
                ),
                subtitle: TextWidet(
                  text: 'Agriculture Facility Hotline Number',
                  fw: FontWeight.normal,
                  color: Colors.grey,
                  fontSize: 12.0,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
