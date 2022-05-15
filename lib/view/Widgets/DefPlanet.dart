import 'package:flutter/material.dart';

import '../../Constants.dart';
import '../Screens/PlanetData.dart';

class DefPlanet extends StatefulWidget {
  String planetName;
  String urlToImage;

  DefPlanet({required this.planetName, required this.urlToImage});

  @override
  State<DefPlanet> createState() => _DefPlanetState();
}

class _DefPlanetState extends State<DefPlanet> {

bool isShown = true;

  @override
  Widget build(BuildContext context) {
    return (isShown)?GestureDetector(
      onTap: ()
      {
        setState(() {
          isShown = !isShown;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                widget.planetName,
                style: const TextStyle(
                    color: contCol,
                    fontSize: iconSize,
                    fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(onPressed: ()
            {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => PlanetData(
                        planetName: widget.planetName,
                        urlToImage: widget.urlToImage,
                      ),
                    ));




              });
            }, icon: const Icon(Icons.visibility_outlined,size: iconSize,color: contCol,))
          ],
        ),
      ),
    ):
    GestureDetector(
      onTap: () {
        setState(() {
          isShown = !isShown;
        });

      },
      child: Row(
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsetsDirectional.all(15.0),
            decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadiusDirectional.circular(40.0),
                border: Border.all(
                    color: contCol,
                    width: 2.0,
                    style: BorderStyle.solid)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.planetName,
                    style: const TextStyle(
                        color: contCol,
                        fontSize: iconSize,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        widget.urlToImage,
                        height: 40.0,
                        fit: BoxFit.cover,
                      )),
                ),
              ],
            ),
          )),
          Container(
            height: 2,
            width: 40,
            decoration: const BoxDecoration(
              color: contCol,
            ),
          )
        ],
      ),
    );
  }
}
