import 'package:imarket_app/models/imarket_app/product_model.dart';
import 'package:imarket_app/models/imarket_app/user_model.dart';

class OrdersModel {
  final String history;
  final String time;
  final List<ProductForBuy> productsBuying;
  final UserModel user;
  final int priceOfAllProducts;

  OrdersModel(this.history, this.time, this.productsBuying, this.user,this
      .priceOfAllProducts);
}