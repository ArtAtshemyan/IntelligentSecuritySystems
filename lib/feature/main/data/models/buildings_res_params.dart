class BuildingsResParams {
  List<Building> buildings;

  BuildingsResParams({required this.buildings});

  factory BuildingsResParams.fromJson(Map<String, dynamic> json) {
    var buildingsList = json['buildings'] as List;
    List<Building> buildings = buildingsList.map((i) => Building.fromJson(i)).toList();

    return BuildingsResParams(buildings: buildings);
  }

  Map<String, dynamic> toJson() {
    return {
      'buildings': buildings.map((b) => b.toJson()).toList(),
    };
  }
}

class Building {
  int id;
  String address;
  List<Device> devices;

  Building({required this.id, required this.address, required this.devices});

  factory Building.fromJson(Map<String, dynamic> json) {
    var devicesList = json['devices'] as List;
    List<Device> devices = devicesList.map((i) => Device.fromJson(i)).toList();

    return Building(
      id: json['id'],
      address: json['address'],
      devices: devices,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'address': address,
      'devices': devices.map((d) => d.toJson()).toList(),
    };
  }
}

class Device {
  int id;
  String name;
  String type;
  int active;
  Accesses accesses;
  int entrance;

  Device({
    required this.id,
    required this.name,
    required this.type,
    required this.active,
    required this.accesses,
    required this.entrance,
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      active: json['active'],
      accesses: Accesses.fromJson(json['accesses']),
      entrance: json['entrance'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'active': active,
      'accesses': accesses.toJson(),
      'entrance': entrance,
    };
  }
}

class Accesses {
  AccessType o;
  AccessType qr;
  AccessType vc;
  AccessType fr;

  Accesses({
    required this.o,
    required this.qr,
    required this.vc,
    required this.fr,
  });

  factory Accesses.fromJson(Map<String, dynamic> json) {
    return Accesses(
      o: AccessType.fromJson(json['o']),
      qr: AccessType.fromJson(json['qr']),
      vc: AccessType.fromJson(json['vc']),
      fr: AccessType.fromJson(json['fr']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'o': o.toJson(),
      'qr': qr.toJson(),
      'vc': vc.toJson(),
      'fr': fr.toJson(),
    };
  }
}

class AccessType {
  String key;
  String name;
  int value;

  AccessType({required this.key, required this.name, required this.value});

  factory AccessType.fromJson(Map<String, dynamic> json) {
    return AccessType(
      key: json['key'],
      name: json['name'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'name': name,
      'value': value,
    };
  }
}