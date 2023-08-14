abstract final class APIConst{

  static final _baseUrl=Uri.parse("https://cbu.uz/oz/arkhiv-kursov-valyut/json");

  //Hamma malumotni olish
  static String allusersPath="$_baseUrl/all/";

  //CCY va Date(optional) bo'yicha bitta malumot olish
  static String getCurrencyByCcy({required String ccy,String? date}) {
    return "$_baseUrl/$ccy/${date == null ? "" : "$date/"}";
  }
}