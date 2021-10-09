import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:information_chest/models/celestial_body_model.dart';

class Universe extends StatelessWidget {
  final String apiUrl = "https://api.le-systeme-solaire.net/rest/bodies/";

  const Universe({Key? key}) : super(key: key);

  Future<List<dynamic>> fetchCelestialObjects() async {
    List<CelestialBodyModel> celestialBody = [];

    try {
      final response = await http.get(Uri.parse(apiUrl));
      var res = await json.decode(response.body)['bodies'];
      for (var calestBody in res) {
        celestialBody.add(CelestialBodyModel.fromJson(calestBody));
      }

      // print(celestialBody.length);
    } catch (e) {
      // print("here");
      // print(e);
      // print("here");
    }

    return celestialBody;
  }

  String name(dynamic celestialBody) {
    // print(celestialBody);
    return celestialBody['englishName'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Universe'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchCelestialObjects(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  CelestialBodyModel calestialBodyModel = snapshot.data[index];
                  return Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Text(calestialBodyModel.englishName),
                          title: Column(
                            children: [
                              displayInfo(
                                  "Scientific name", calestialBodyModel.name),
                              displayInfo("IsPlanet",
                                  calestialBodyModel.isPlanet.toString()),
                              displayInfo("SemiMajor Axis",
                                  calestialBodyModel.semimajorAxis.toString()),
                              displayInfo("perihelion",
                                  calestialBodyModel.perihelion.toString()),
                              displayInfo("aphelion",
                                  calestialBodyModel.aphelion.toString()),
                              displayInfo("eccentricity",
                                  calestialBodyModel.eccentricity.toString()),
                              displayInfo("inclination",
                                  calestialBodyModel.inclination.toString()),
                              const Text("Mass"),
                              displayInfo("massValue",
                                  calestialBodyModel.mass.massValue.toString()),
                              displayInfo(
                                  "massExponent",
                                  calestialBodyModel.mass.massExponent
                                      .toString()),
                              const Text("Vol"),
                              displayInfo("volValue",
                                  calestialBodyModel.vol.volValue.toString()),
                              displayInfo(
                                  "volExponent",
                                  calestialBodyModel.vol.volExponent
                                      .toString()),
                              displayInfo("density",
                                  calestialBodyModel.density.toString()),
                              displayInfo("gravity",
                                  calestialBodyModel.gravity.toString()),
                              displayInfo("escape",
                                  calestialBodyModel.escape.toString()),
                              displayInfo("meanRadius",
                                  calestialBodyModel.meanRadius.toString()),
                              displayInfo("equaRadius",
                                  calestialBodyModel.equaRadius.toString()),
                              displayInfo("polarRadius",
                                  calestialBodyModel.polarRadius.toString()),
                              displayInfo("flattening",
                                  calestialBodyModel.flattening.toString()),
                              displayInfo("dimension",
                                  calestialBodyModel.dimension.toString()),
                              displayInfo("sideralOrbit",
                                  calestialBodyModel.sideralOrbit.toString()),
                              displayInfo(
                                  "sideralRotation",
                                  calestialBodyModel.sideralRotation
                                      .toString()),
                              const Text("Around Planet"),
                              displayInfo(
                                  "planet",
                                  calestialBodyModel.aroundPlanet.planet
                                      .toString()),
                              // displayInfo("rel", calestialBodyModel.aroundPlanet.rel.toString()),
                              displayInfo("discoveredBy",
                                  calestialBodyModel.discoveredBy.toString()),
                              displayInfo("discoveryDate",
                                  calestialBodyModel.discoveryDate.toString()),
                              displayInfo(
                                  "alternativeName",
                                  calestialBodyModel.alternativeName
                                      .toString()),
                              displayInfo("axialTilt",
                                  calestialBodyModel.axialTilt.toString()),
                              displayInfo("avgTemp",
                                  calestialBodyModel.avgTemp.toString()),
                              displayInfo("mainAnomaly",
                                  calestialBodyModel.mainAnomaly.toString()),
                              displayInfo("argPeriapsis",
                                  calestialBodyModel.argPeriapsis.toString()),
                              displayInfo("longAscNode",
                                  calestialBodyModel.longAscNode.toString()),
                              // displayInfo("rel", calestialBodyModel.rel.toString()),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
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
