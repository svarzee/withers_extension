import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:class_extensions/class_extensions.dart';
import 'package:source_gen/source_gen.dart';
import 'package:withers_extension_annotations/annotations.dart';

class WithersGenerator extends ClassExtensionGenerator<Withers> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    ClassElement clazz = element;
    final out = StringBuffer();
    clazz.fields.forEach((field) => out.writeln(_generateWither(clazz, field)));
    return out.toString();
  }

  String _generateWither(ClassElement clazz, FieldElement field) {
    final witherName =
        'with${field.name[0].toUpperCase()}${field.name.substring(1)}';
    return '${clazz.name} ${witherName}(${field.type.name} val) => ${clazz.name}${_generateCtor(clazz, field)};';
  }

  String _generateCtor(ClassElement clazz, FieldElement field) {
    final out = StringBuffer();
    out.write('(');
    out.write(clazz.unnamedConstructor.parameters
        .map((param) => _generateCtorArg(clazz, field, param))
        .join(', '));
    out.write(')');
    return out.toString();
  }

  String _generateCtorArg(
      ClassElement clazz, FieldElement field, ParameterElement param) {
    return field.name == param.name
        ? 'val'
        : '(this as ${clazz.name}).${param.name}';
  }
}
