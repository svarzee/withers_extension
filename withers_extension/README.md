Description
---
This package uses class_extensions to generate withers.

Tutorial
---
1. We need a class to generate withers for. You usually want to generate withers for immutable classes.

    ##### `${PROJECT_ROOT}/lib/model.dart`
    ```dart
    import 'package:meta/meta.dart';
    
    @immutable
    class SomeValueClass {
      final String strVal;
      final int intVal;
    }
    ```

2. For withers to work you need to add some boiler plate:
    * `part 'model.g.dart';`
    * annotation `@Withers()`
    * mixin `_$SomeValueClass`
    * all args constructor `SomeValueClass(this.strVal, this.intVal);`

    ##### `${PROJECT_ROOT}/lib/model.dart`
    ```dart
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
    ```

3. Configure code generation. More info at [build](https://github.com/dart-lang/build).

    ##### `${PROJECT_ROOT}/build.yaml`
    ```yaml
    targets:
      $default:
        builders:
          withers_extension|withers:
            generate_for:
            - lib/*.dart
    ```
4. Add dependencies.

    ##### `${PROJECT_ROOT}/pubspec.yaml`
    ```yaml
    name: example

    dependencies:
      class_extensions_annotations: ^0.1.0
      withers_extension_annotations: ^0.1.0

    dev_dependencies:
      build_runner: ^1.0.0
      class_extensions: ^0.3.0
      withers_extension: ^0.5.0
    ```

5. Run code generation: `pub run build_runner build`. File `${PROJECT_ROOT}/lib/model.g.dart` should be created.

6. If everything goes well you should be able to use withers.

    ##### `${PROJECT_ROOT}/bin/main.dart`
    ```dart
    import 'package:example/model.dart';
    
    void main() {
      var some = SomeValueClass("some", 0);
      var other = some.withIntVal(1).withStrVal("other");
    }
    ```

7. You can also see the [example](https://github.com/svarzee/withers_extension/tree/master/withers_extension/example).
