class CelestialBodyModel {
  String id;
  String name;
  String englishName;
  bool isPlanet;

  // int moons;  //always null no need to add it
  double semimajorAxis;
  double perihelion;
  double aphelion;
  double eccentricity;
  double inclination;
  Mass mass;
  Vol vol;
  double density;
  double gravity;
  double escape;
  double meanRadius;
  double equaRadius;
  double polarRadius;
  double flattening;
  String dimension;
  double sideralOrbit;
  double sideralRotation;
  AroundPlanet aroundPlanet;
  String discoveredBy;
  String discoveryDate;
  String alternativeName;
  double axialTilt;
  double avgTemp;
  double mainAnomaly;
  double argPeriapsis;
  double longAscNode;
  String rel;

  CelestialBodyModel(
      this.id,
      this.name,
      this.englishName,
      this.isPlanet,
      // this.moons,
      this.semimajorAxis,
      this.perihelion,
      this.aphelion,
      this.eccentricity,
      this.inclination,
      this.mass,
      this.vol,
      this.density,
      this.gravity,
      this.escape,
      this.meanRadius,
      this.equaRadius,
      this.polarRadius,
      this.flattening,
      this.dimension,
      this.sideralOrbit,
      this.sideralRotation,
      this.aroundPlanet,
      this.discoveredBy,
      this.discoveryDate,
      this.alternativeName,
      this.axialTilt,
      this.avgTemp,
      this.mainAnomaly,
      this.argPeriapsis,
      this.longAscNode,
      this.rel);

  CelestialBodyModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        englishName = json['englishName'],
        isPlanet = json['isPlanet'],
        // moons = json['moons'],
        semimajorAxis = json['semimajorAxis'].toDouble(),
        perihelion = json['perihelion'].toDouble(),
        aphelion = json['aphelion'].toDouble(),
        eccentricity = json['eccentricity'].toDouble(),
        inclination = json['inclination'].toDouble(),
        mass = (json['mass'] is Map)
            ? Mass.fromJson(json['mass'])
            : Mass(0.00, 0.00),
        vol =
            (json['vol'] is Map) ? Vol.fromJson(json['vol']) : Vol(0.00, 0.00),
        density = json['density'].toDouble(),
        gravity = json['gravity'].toDouble(),
        escape = json['escape'].toDouble(),
        meanRadius = json['meanRadius'].toDouble(),
        equaRadius = json['equaRadius'].toDouble(),
        polarRadius = json['polarRadius'].toDouble(),
        flattening = json['flattening'].toDouble(),
        dimension = json['dimension'],
        sideralOrbit = json['sideralOrbit'].toDouble(),
        sideralRotation = json['sideralRotation'].toDouble(),
        aroundPlanet = (json['aroundPlanet'] is Map)
            ? AroundPlanet.fromJson(json['aroundPlanet'])
            : AroundPlanet("Null", "NULL"),
        discoveredBy = json['discoveredBy'],
        discoveryDate = json['discoveryDate'],
        alternativeName = json['alternativeName'],
        axialTilt = json['axialTilt'].toDouble(),
        avgTemp = json['avgTemp'].toDouble(),
        mainAnomaly = json['mainAnomaly'].toDouble(),
        argPeriapsis = json['argPeriapsis'].toDouble(),
        longAscNode = json['longAscNode'].toDouble(),
        rel = json['rel'];
}

class Mass {
  double massValue;
  double massExponent;

  Mass(this.massValue, this.massExponent);

  Mass.fromJson(Map<String, dynamic> json)
      : massValue = json['massValue'].toDouble(),
        massExponent = json['massExponent'].toDouble();
}

class Vol {
  double volValue;
  double volExponent;

  Vol(this.volValue, this.volExponent);

  Vol.fromJson(Map<String, dynamic> json)
      : volValue = json['volValue'].toDouble(),
        volExponent = json['volExponent'].toDouble();
}

class AroundPlanet {
  String planet;
  String rel;

  AroundPlanet(this.planet, this.rel);

  AroundPlanet.fromJson(Map<String, dynamic> json)
      : planet = json['planet'],
        rel = json['rel'];
}
