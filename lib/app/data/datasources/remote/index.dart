export 'dtos/product_dto.dart';
export 'requests/login_request.dart';
export 'responses/login_response.dart';
export 'responses/products_response.dart';
import 'package:quiver/core.dart';

T? checkOptional<T>(Optional<T?>? optional, T? Function()? def) {
  // No value given, just take default value
  if (optional == null) return def?.call();

  // We have an input value
  if (optional.isPresent) return optional.value;

  // We have a null inside the optional
  return null;
}
