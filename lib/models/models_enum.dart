enum Method { plus, minus, devide, mult, eq }

// ignore: missing_return
String getMethods(Method methods) {
  switch (methods) {
    case Method.plus:
      return '+';
      break;
    case Method.minus:
      return '-';
      break;
    case Method.devide:
      return '/';
      break;
    case Method.mult:
      return '*';
      break;
    case Method.eq:
      return '=';
      break;
  }
}
