import 'package:universal_js_interop/src/internal.dart' show Since;
import 'package:universal_js_interop/src/js_types.dart';
import 'package:universal_js_interop/src/typed_data.dart';

class JS {
  final String? name;
  const JS([this.name]);
}

extension type JSAny._(JSAnyRepType _jsAny) implements Object {}

@JS('Object')
extension type JSObject._(JSObjectRepType _jsObject) implements JSAny {
  JSObject.fromInteropObject(Object interopObject)
      : _jsObject = interopObject as JSObjectRepType;

  JSObject() : _jsObject = _createObjectLiteral();
}

external JSObjectRepType _createObjectLiteral();

@JS('Function')
extension type JSFunction._(JSFunctionRepType _jsFunction)
    implements JSObject {}

@JS('Function')
extension type JSExportedDartFunction._(
        JSExportedDartFunctionRepType _jsExportedDartFunction)
    implements JSFunction {}

@JS('Array')
extension type JSArray<T extends JSAny?>._(JSArrayRepType _jsArray)
    implements JSObject {
  external JSArray();

  external JSArray.withLength(int length);

  @Since('3.6')
  external static JSArray<T> from<T extends JSAny>(JSObject arrayLike);

  @Since('3.6')
  external int get length;

  @Since('3.6')
  external set length(int newLength);

  @Since('3.6')
  external T operator [](int position);

  @Since('3.6')
  external void operator []=(int position, T value);
}

@JS('Promise')
extension type JSPromise<T extends JSAny?>._(JSPromiseRepType _jsPromise)
    implements JSObject {
  external JSPromise(JSFunction executor);
}

@JS('Object')
extension type JSBoxedDartObject._(JSBoxedDartObjectRepType _jsBoxedDartObject)
    implements JSObject {}

@JS('ArrayBuffer')
extension type JSArrayBuffer._(JSArrayBufferRepType _jsArrayBuffer)
    implements JSObject {
  @Since('3.6')
  external JSArrayBuffer(int length, [JSObject options]);
}

@JS('DataView')
extension type JSDataView._(JSDataViewRepType _jsDataView) implements JSObject {
  @Since('3.6')
  external JSDataView(JSArrayBuffer buffer, [int byteOffset, int byteLength]);
}

extension type JSTypedArray._(JSTypedArrayRepType _jsTypedArray)
    implements JSObject {}

@JS('Int8Array')
extension type JSInt8Array._(JSInt8ArrayRepType _jsInt8Array)
    implements JSTypedArray {
  @Since('3.6')
  external JSInt8Array([JSArrayBuffer buffer, int byteOffset, int length]);

  @Since('3.6')
  external JSInt8Array.withLength(int length);
}

@JS('Uint8Array')
extension type JSUint8Array._(JSUint8ArrayRepType _jsUint8Array)
    implements JSTypedArray {
  @Since('3.6')
  external JSUint8Array([JSArrayBuffer buffer, int byteOffset, int length]);

  @Since('3.6')
  external JSUint8Array.withLength(int length);
}

@JS('Uint8ClampedArray')
extension type JSUint8ClampedArray._(
    JSUint8ClampedArrayRepType _jsUint8ClampedArray) implements JSTypedArray {
  @Since('3.6')
  external JSUint8ClampedArray(
      [JSArrayBuffer buffer, int byteOffset, int length]);

  @Since('3.6')
  external JSUint8ClampedArray.withLength(int length);
}

@JS('Int16Array')
extension type JSInt16Array._(JSInt16ArrayRepType _jsInt16Array)
    implements JSTypedArray {
  @Since('3.6')
  external JSInt16Array([JSArrayBuffer buffer, int byteOffset, int length]);

  @Since('3.6')
  external JSInt16Array.withLength(int length);
}

@JS('Uint16Array')
extension type JSUint16Array._(JSUint16ArrayRepType _jsUint16Array)
    implements JSTypedArray {
  @Since('3.6')
  external JSUint16Array([JSArrayBuffer buffer, int byteOffset, int length]);

  @Since('3.6')
  external JSUint16Array.withLength(int length);
}

@JS('Int32Array')
extension type JSInt32Array._(JSInt32ArrayRepType _jsInt32Array)
    implements JSTypedArray {
  @Since('3.6')
  external JSInt32Array([JSArrayBuffer buffer, int byteOffset, int length]);

  @Since('3.6')
  external JSInt32Array.withLength(int length);
}

@JS('Uint32Array')
extension type JSUint32Array._(JSUint32ArrayRepType _jsUint32Array)
    implements JSTypedArray {
  @Since('3.6')
  external JSUint32Array([JSArrayBuffer buffer, int byteOffset, int length]);

  @Since('3.6')
  external JSUint32Array.withLength(int length);
}

@JS('Float32Array')
extension type JSFloat32Array._(JSFloat32ArrayRepType _jsFloat32Array)
    implements JSTypedArray {
  @Since('3.6')
  external JSFloat32Array([JSArrayBuffer buffer, int byteOffset, int length]);

  @Since('3.6')
  external JSFloat32Array.withLength(int length);
}

@JS('Float64Array')
extension type JSFloat64Array._(JSFloat64ArrayRepType _jsFloat64Array)
    implements JSTypedArray {
  @Since('3.6')
  external JSFloat64Array([JSArrayBuffer buffer, int byteOffset, int length]);

  @Since('3.6')
  external JSFloat64Array.withLength(int length);
}

extension type JSNumber._(JSNumberRepType _jsNumber) implements JSAny {}

extension type JSBoolean._(JSBooleanRepType _jsBoolean) implements JSAny {}

extension type JSString._(JSStringRepType _jsString) implements JSAny {}

extension type JSSymbol._(JSSymbolRepType _jsSymbol) implements JSAny {}

extension type JSBigInt._(JSBigIntRepType _jsBigInt) implements JSAny {}

extension type ExternalDartReference<T extends Object?>._(
    ExternalDartReferenceRepType<T> _externalDartReference) {}

typedef JSVoid = JSVoidRepType;

extension NullableUndefineableJSAnyExtension on JSAny? {
  external bool get isUndefined;

  external bool get isNull;

  bool get isUndefinedOrNull => this == null;
  bool get isDefinedAndNotNull => !isUndefinedOrNull;
}

extension JSAnyUtilityExtension on JSAny? {
  external bool typeofEquals(String typeString);

  external bool instanceof(JSFunction constructor);

  bool instanceOfString(String constructorName) {
    throw Exception("Not Implemented");
  }

  @Since('3.4')
  external bool isA<T extends JSAny?>();

  external Object? dartify();
}

extension NullableObjectUtilExtension on Object? {
  external JSAny? jsify();
}

extension JSFunctionUtilExtension on JSFunction {
  @JS('call')
  external JSAny? callAsFunction(
      [JSAny? thisArg, JSAny? arg1, JSAny? arg2, JSAny? arg3, JSAny? arg4]);
}

extension JSExportedDartFunctionToFunction on JSExportedDartFunction {
  external Function get toDart;
}

extension FunctionToJSExportedDartFunction on Function {
  external JSExportedDartFunction get toJS;

  @Since('3.6')
  external JSExportedDartFunction get toJSCaptureThis;
}

extension JSBoxedDartObjectToObject on JSBoxedDartObject {
  external Object get toDart;
}

extension ObjectToJSBoxedDartObject on Object {
  external JSBoxedDartObject get toJSBox;
}

extension ExternalDartReferenceToObject<T extends Object?>
    on ExternalDartReference<T> {
  external T get toDartObject;
}

extension ObjectToExternalDartReference<T extends Object?> on T {
  external ExternalDartReference<T> get toExternalReference;
}

extension JSPromiseToFuture<T extends JSAny?> on JSPromise<T> {
  external Future<T> get toDart;
}

extension FutureOfJSAnyToJSPromise<T extends JSAny?> on Future<T> {
  JSPromise<T> get toJS {
    throw Exception("Not Implemented");
  }
}

extension FutureOfVoidToJSPromise on Future<void> {
  JSPromise get toJS {
    throw Exception("Not Implemented");
  }
}

extension JSArrayBufferToByteBuffer on JSArrayBuffer {
  external ByteBuffer get toDart;
}

extension ByteBufferToJSArrayBuffer on ByteBuffer {
  external JSArrayBuffer get toJS;
}

extension JSDataViewToByteData on JSDataView {
  external ByteData get toDart;
}

extension ByteDataToJSDataView on ByteData {
  external JSDataView get toJS;
}

extension JSInt8ArrayToInt8List on JSInt8Array {
  external Int8List get toDart;
}

extension Int8ListToJSInt8Array on Int8List {
  external JSInt8Array get toJS;
}

extension JSUint8ArrayToUint8List on JSUint8Array {
  external Uint8List get toDart;
}

extension Uint8ListToJSUint8Array on Uint8List {
  external JSUint8Array get toJS;
}

extension JSUint8ClampedArrayToUint8ClampedList on JSUint8ClampedArray {
  external Uint8ClampedList get toDart;
}

extension Uint8ClampedListToJSUint8ClampedArray on Uint8ClampedList {
  external JSUint8ClampedArray get toJS;
}

extension JSInt16ArrayToInt16List on JSInt16Array {
  external Int16List get toDart;
}

extension Int16ListToJSInt16Array on Int16List {
  external JSInt16Array get toJS;
}

extension JSUint16ArrayToInt16List on JSUint16Array {
  external Uint16List get toDart;
}

extension Uint16ListToJSInt16Array on Uint16List {
  external JSUint16Array get toJS;
}

extension JSInt32ArrayToInt32List on JSInt32Array {
  external Int32List get toDart;
}

extension Int32ListToJSInt32Array on Int32List {
  external JSInt32Array get toJS;
}

extension JSUint32ArrayToUint32List on JSUint32Array {
  external Uint32List get toDart;
}

extension Uint32ListToJSUint32Array on Uint32List {
  external JSUint32Array get toJS;
}

extension JSFloat32ArrayToFloat32List on JSFloat32Array {
  external Float32List get toDart;
}

extension Float32ListToJSFloat32Array on Float32List {
  external JSFloat32Array get toJS;
}

extension JSFloat64ArrayToFloat64List on JSFloat64Array {
  external Float64List get toDart;
}

extension Float64ListToJSFloat64Array on Float64List {
  external JSFloat64Array get toJS;
}

extension JSArrayToList<T extends JSAny?> on JSArray<T> {
  external List<T> get toDart;
}

extension ListToJSArray<T extends JSAny?> on List<T> {
  external JSArray<T> get toJS;

  external JSArray<T> get toJSProxyOrRef;
}

extension JSNumberToNumber on JSNumber {
  external double get toDartDouble;

  external int get toDartInt;
}

extension DoubleToJSNumber on double {
  external JSNumber get toJS;
}

extension NumToJSExtension on num {
  JSNumber get toJS => DoubleToJSNumber(toDouble()).toJS;
}

extension JSBooleanToBool on JSBoolean {
  external bool get toDart;
}

extension BoolToJSBoolean on bool {
  external JSBoolean get toJS;
}

extension JSStringToString on JSString {
  external String get toDart;
}

extension StringToJSString on String {
  external JSString get toJS;
}

extension JSAnyOperatorExtension on JSAny? {
  external JSAny add(JSAny? any);

  external JSAny subtract(JSAny? any);

  external JSAny multiply(JSAny? any);

  external JSAny divide(JSAny? any);

  external JSAny modulo(JSAny? any);

  external JSAny exponentiate(JSAny? any);

  external JSBoolean greaterThan(JSAny? any);

  external JSBoolean greaterThanOrEqualTo(JSAny? any);

  external JSBoolean lessThan(JSAny? any);

  external JSBoolean lessThanOrEqualTo(JSAny? any);

  external JSBoolean equals(JSAny? any);

  external JSBoolean notEquals(JSAny? any);

  external JSBoolean strictEquals(JSAny? any);

  external JSBoolean strictNotEquals(JSAny? any);

  external JSNumber unsignedRightShift(JSAny? any);

  external JSAny? and(JSAny? any);

  external JSAny? or(JSAny? any);

  external JSBoolean get not;

  external JSBoolean get isTruthy;
}

external JSObject get globalContext;

external JSObject createJSInteropWrapper<T extends Object>(T dartObject);

external JSPromise<JSObject> importModule(JSAny moduleName);
