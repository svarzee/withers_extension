import 'package:example/model.dart';

void main() {
  var some = SomeValueClass("some", 0);
  var other = some.withIntVal(1).withStrVal("other");
}
