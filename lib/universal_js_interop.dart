library universal_js_interop;

export 'src/js_util.dart' if (dart.library.html) 'dart:js_util';
export 'src/js_interop.dart' if (dart.library.html) 'dart:js_interop';
export 'src/js_annotations.dart';
export 'src/js_types.dart';
export 'src/typed_data.dart' if (dart.library.html) 'dart:typed_data';
