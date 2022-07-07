import 'package:imarket_app/models/imarket_app/product_model.dart';
import 'package:imarket_app/models/imarket_app/wholesaler_model.dart';

class WholesalerOrdersModel {
  final String history;
  final String time;
  final List<ProductForBuy> productsBuying;
  final WholesalerModel wholesalerUser;
  final int priceOfAllProducts;

  WholesalerOrdersModel(this.history, this.time, this.productsBuying, this
      .wholesalerUser,this
      .priceOfAllProducts);
}