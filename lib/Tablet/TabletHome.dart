import 'package:flutter/material.dart';

import '../utils/constants.dart';


class Tablethome extends StatelessWidget {
  const Tablethome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        drawer: MyDrawer,
        body: Column(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 1.8,
                child: GridView.builder(
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(

                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),

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
