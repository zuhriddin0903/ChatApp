import 'package:flutter/material.dart';

import '../utils/constants.dart';


class Desktophome extends StatelessWidget {
  const Desktophome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Row(
          children: [
            MyDrawer,
            Expanded(
              child: AspectRatio(
                aspectRatio: 1.5,
                child: GridView.builder(
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.blue,

                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        )
    );
  }
}
