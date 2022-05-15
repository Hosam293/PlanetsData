import 'package:flutter/material.dart';
import 'package:galaxy/Constants.dart';

class PlanetData extends StatefulWidget {
  String planetName;
  String urlToImage;

  PlanetData({required this.planetName, required this.urlToImage});

  @override
  State<PlanetData> createState() => _PlanetDataState();
}

class _PlanetDataState extends State<PlanetData> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          elevation: 0.0,
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
            ),
            onTap: () {

              Navigator.pop(context);

            },
          )),
      body: Column(
        children: [
          Expanded(
              child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(200.0),
                    bottomLeft: Radius.circular(200.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ListTile(
                  title: Text(
                    '${widget.planetName}',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    'THE RED PLANET',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.network(
                    widget.urlToImage,
                    width: 250,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          )),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(left: 15.0, top: 15.0),
              itemBuilder: (BuildContext context, int index) => Row(
                children: [
                  Text(
                    '${planetData[index]}',
                    style: TextStyle(color: Colors.teal, fontSize: 18.0),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: Text(
                      '${planetValue[index]}',
                      style:
                          TextStyle(color: Colors.deepOrange, fontSize: 18.0),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                height: 8.0,
              ),
              itemCount: planetValue.length,
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
