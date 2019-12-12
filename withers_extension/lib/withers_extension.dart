import 'package:build/build.dart';
import 'package:class_extensions/class_extensions.dart';

import 'src/withers_generator.dart';

Builder withersDummyBuilder(BuilderOptions options) =>
    registerClassExtensionGenerator(1, WithersGenerator());
