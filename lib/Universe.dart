import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:information_chest/CelestialBodyModel.dart';

class Universe extends StatelessWidget {
  final String apiUrl = "https://api.le-systeme-solaire.net/rest/bodies/";

  Future<List<dynamic>> fetchCelestialObjects() async {
    List<CelestialBodyModel> celestialBody = [];

    try {
      final response = await http.get(Uri.parse(apiUrl));
      var res = await json.decode(response.body)['bodies'];
      for (var CelestialBody in res) {
        celestialBody.add(CelestialBodyModel.fromJson(CelestialBody));
      }

      // print(celestialBody.length);
    } catch (e) {
      print("here");
      print(e);
      print("here");
    }

    return celestialBody;
  }

  String _name(dynamic celestialBody) {
    // print(celestialBody);
    return celestialBody['englishName'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Universe'),
      ),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: fetchCelestialObjects(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    CelestialBodyModel CelestialBody = snapshot.data[index];
                    return Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: Text(CelestialBody.englishName),
                            title: Column(
                              children: [
                                displayInfo(
                                    "Scientific name", CelestialBody.name),
                                displayInfo("IsPlanet",
                                    CelestialBody.isPlanet.toString()),
                                displayInfo("SemiMajor Axis",
                                    CelestialBody.semimajorAxis.toString()),
                                displayInfo("perihelion",
                                    CelestialBody.perihelion.toString()),
                                displayInfo("aphelion",
                                    CelestialBody.aphelion.toString()),
                                displayInfo("eccentricity",
                                    CelestialBody.eccentricity.toString()),
                                displayInfo("inclination",
                                    CelestialBody.inclination.toString()),
                                Text("Mass"),
                                displayInfo("massValue",
                                    CelestialBody.mass.massValue.toString()),
                                displayInfo("massExponent",
                                    CelestialBody.mass.massExponent.toString()),
                                Text("Vol"),
                                displayInfo("volValue",
                                    CelestialBody.vol.volValue.toString()),
                                displayInfo("volExponent",
                                    CelestialBody.vol.volExponent.toString()),
                                displayInfo("density",
                                    CelestialBody.density.toString()),
                                displayInfo("gravity",
                                    CelestialBody.gravity.toString()),
                                displayInfo(
                                    "escape", CelestialBody.escape.toString()),
                                displayInfo("meanRadius",
                                    CelestialBody.meanRadius.toString()),
                                displayInfo("equaRadius",
                                    CelestialBody.equaRadius.toString()),
                                displayInfo("polarRadius",
                                    CelestialBody.polarRadius.toString()),
                                displayInfo("flattening",
                                    CelestialBody.flattening.toString()),
                                displayInfo("dimension",
                                    CelestialBody.dimension.toString()),
                                displayInfo("sideralOrbit",
                                    CelestialBody.sideralOrbit.toString()),
                                displayInfo("sideralRotation",
                                    CelestialBody.sideralRotation.toString()),
                                Text("Around Planet"),
                                displayInfo(
                                    "planet",
                                    CelestialBody.aroundPlanet.planet
                                        .toString()),
                                // displayInfo("rel", CelestialBody.aroundPlanet.rel.toString()),
                                displayInfo("discoveredBy",
                                    CelestialBody.discoveredBy.toString()),
                                displayInfo("discoveryDate",
                                    CelestialBody.discoveryDate.toString()),
                                displayInfo("alternativeName",
                                    CelestialBody.alternativeName.toString()),
                                displayInfo("axialTilt",
                                    CelestialBody.axialTilt.toString()),
                                displayInfo("avgTemp",
                                    CelestialBody.avgTemp.toString()),
                                displayInfo("mainAnomaly",
                                    CelestialBody.mainAnomaly.toString()),
                                displayInfo("argPeriapsis",
                                    CelestialBody.argPeriapsis.toString()),
                                displayInfo("longAscNode",
                                    CelestialBody.longAscNode.toString()),
                                // displayInfo("rel", CelestialBody.rel.toString()),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget displayInfo(String heading, String data) {
    return Row(children: [
      Text(heading + ": "),
      Text(data),
    ]);
  }
}
