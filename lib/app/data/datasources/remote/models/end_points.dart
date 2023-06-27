class EndPoints {
  final AuthEndPoints authEndPoints;
  final ProductEndPoints productEndPoints;

  EndPoints()
      : authEndPoints = AuthEndPoints(),
        productEndPoints = ProductEndPoints();
}

class AuthEndPoints {
  final String logIn;

  AuthEndPoints({this.logIn = "/login"});
}

class ProductEndPoints {
  final String resource;

  ProductEndPoints({this.resource = "/products"});
}
