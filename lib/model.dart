
class ModelInfo{

  String _name ='';
  String _family ='';

  ModelInfo(this._name, this._family);

  String get family => _family;

  set family(String value) {
    _family = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}




