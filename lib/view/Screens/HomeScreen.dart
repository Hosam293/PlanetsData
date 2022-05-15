import 'package:flutter/material.dart';
import 'package:galaxy/Constants.dart';
import 'package:galaxy/view/Widgets/DefPlanet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        actions: [
          Container(
            decoration: const BoxDecoration(
                color: contCol,
                borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(25.0),
                    bottomStart: Radius.circular(25.0))),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.list_outlined, color: background, size: iconSize),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, top: 15.0),
        child: Column(
          children: [
            const Text(
              'PLANET',
              style: TextStyle(
                  color:contCol,
                  fontSize: iconSize,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) => const SizedBox(
                    height: 5.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return DefPlanet(
                      urlToImage: planetsImg[index],
                      planetName: planetsName[index],
                    );
                  },
                  itemCount: planetsImg.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
