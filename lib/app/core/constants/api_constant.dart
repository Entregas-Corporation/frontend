final class ApiConstant {
  static const String baseURI = "http://20.36.179.8";

  static const String userLogin = "$baseURI/user/login";
  static const String userRegister = "$baseURI/user/register";
  static const String userDetail = "$baseURI/user/detail";

  static const String listProductCategory =
      "$baseURI/product-category/list/valid";

  static const String listProductValid = "$baseURI/product/list/valid";
  static const String listProductByProductCategory =
      "$baseURI/product/list/product-category/valid";
  static const String listProductByInstitute =
      "$baseURI/product/list/institute/valid";
  static const String registerProduct = "$baseURI/product/register";
  static const String detailProduct = "$baseURI/product/detail";

  static const String listInstituteValid = "$baseURI/institute/list/valid";
  static const String listInstituteValidByUser =
      "$baseURI/institute/list/user/valid";
  static const String detailInstitute = "$baseURI/institute/detail";
  static const String registerInstitute = "$baseURI/institute/register";
}
