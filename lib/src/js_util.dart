external dynamic jsify(Object? object);

external Object get globalThis;

external T newObject<T>();

external bool hasProperty(Object o, Object name);

external T getProperty<T>(Object o, Object name);

external T setProperty<T>(Object o, Object name, T? value);

external T callMethod<T>(Object o, Object method, List<Object?> args);

external bool instanceof(Object? o, Object type);

external T callConstructor<T>(Object constr, List<Object?>? arguments);

external T add<T>(Object? first, Object? second);

external T subtract<T>(Object? first, Object? second);

external T multiply<T>(Object? first, Object? second);

external T divide<T>(Object? first, Object? second);

external T exponentiate<T>(Object? first, Object? second);

external T modulo<T>(Object? first, Object? second);

external bool equal<T>(Object? first, Object? second);

external bool strictEqual<T>(Object? first, Object? second);

external bool notEqual<T>(Object? first, Object? second);

external bool strictNotEqual<T>(Object? first, Object? second);

external bool greaterThan<T>(Object? first, Object? second);

external bool greaterThanOrEqual<T>(Object? first, Object? second);

external bool lessThan<T>(Object? first, Object? second);

external bool lessThanOrEqual<T>(Object? first, Object? second);

external bool typeofEquals<T>(Object? o, String type);

external T not<T>(Object? o);

external bool isTruthy<T>(Object? o);

external T or<T>(Object? first, Object? second);

external T and<T>(Object? first, Object? second);

external bool delete<T>(Object o, Object property);

external num unsignedRightShift(Object? leftOperand, Object? rightOperand);

class NullRejectionException implements Exception {
  final bool isUndefined;

  NullRejectionException(this.isUndefined);

  @override
  String toString() {
    var value = isUndefined ? 'undefined' : 'null';
    return 'Promise was rejected with a value of `$value`.';
  }
}

external Future<T> promiseToFuture<T>(Object jsPromise);

Object? _getConstructor(String constructorName) =>
    getProperty(globalThis, constructorName);

bool instanceOfString(Object? element, String objectType) {
  Object? constructor = _getConstructor(objectType);
  return constructor != null && instanceof(element, constructor);
}

external Object? objectGetPrototypeOf(Object? object);

external Object? get objectPrototype;

external List<Object?> objectKeys(Object? object);

external bool isJavaScriptArray(value);

external bool isJavaScriptSimpleObject(value);

external Object? dartify(Object? o);

external T createStaticInteropMock<T extends Object, U extends Object>(
    U dartMock,
    [Object? proto]);

external Object createDartExport<T extends Object>(T dartObject);

external F allowInterop<F extends Function>(F f);

external Function allowInteropCaptureThis(Function f);
