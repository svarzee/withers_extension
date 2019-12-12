import 'package:meta/meta.dart';
import 'package:withers_extension_annotations/annotations.dart';

part 'model.g.dart';

@Withers()
@immutable
class SomeValueClass with _$SomeValueClass {
  final String strVal;
  final int intVal;

  SomeValueClass(this.strVal, this.intVal);
}

@Withers()
@immutable
class SomeValueClass2 with _$SomeValueClass2 {
  final String strVal;
  final int intVal;

  SomeValueClass2(this.strVal, this.intVal);
}
