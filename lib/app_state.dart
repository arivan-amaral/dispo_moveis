import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _latitudelongitude =
        _latLngFromString(prefs.getString('ff_latitudelongitude'));
  }

  late SharedPreferences prefs;

  LatLng? _latitudelongitude = LatLng(-10.438758, -45.166549);
  LatLng? get latitudelongitude => _latitudelongitude;
  set latitudelongitude(LatLng? _value) {
    if (_value == null) {
      return;
    }
    _latitudelongitude = _value;
    prefs.setString('ff_latitudelongitude', _value.serialize());
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
