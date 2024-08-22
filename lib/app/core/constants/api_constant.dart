final class ApiConstant {
  static const String baseURI = "http://localhost:8080";

  static const String userLogin = "$baseURI/user/login";
  static const String userRegister = "$baseURI/user/register";
  static const String userDetail = "$baseURI/user/detail";

  static const String listProductCategory =
      "$baseURI/product-category/list/valid";
  
  static const String listProductByProductCategory =
      "$baseURI/product/list/product-category/valid";

  static const String listInstituteValid = "$baseURI/institute/list/valid";
}
