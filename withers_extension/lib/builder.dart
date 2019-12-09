import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/withers_generator.dart';

Builder withersBuilder(BuilderOptions options) =>
    SharedPartBuilder([WithersGenerator()], '1_withers',
        formatOutput: (code) => code);
