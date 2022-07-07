abstract class ShopStates {}

class ShopInitialState extends ShopStates {}

class ShopChangeBottomState extends ShopStates {}

class ShopLayoutChangeBottomState extends ShopStates {}
class ShopLayoutChangeActiveDotState extends ShopStates {}



class ShopLoadingHomeDataState extends ShopStates {}

class ShopSuccessHomeDataState extends ShopStates {}

class ShopErrorHomeDataState extends ShopStates {
  final String error;

  ShopErrorHomeDataState(this.error);
}

class ShopSuccessCategoriesState extends ShopStates {}

class ShopErrorCategoriesState extends ShopStates {
  final String error;

  ShopErrorCategoriesState(this.error);
}

class ShopChangeFavoritesState extends ShopStates {}

class ShopSuccessChangeFavoritesState extends ShopStates {

  //TODO Add ChangeFavoritesModel
//  final ChangeFavoritesModel model;
//
//  ShopSuccessChangeFavoritesState(this.model);

}

class ShopErrorChangeFavoritesState extends ShopStates {
  final String error;

  ShopErrorChangeFavoritesState(this.error);
}

class ShopLoadingGetFavoritesState extends ShopStates {}

class ShopSuccessGetFavoritesState extends ShopStates {}

class ShopErrorGetFavoritesState extends ShopStates {
  final String error;

  ShopErrorGetFavoritesState(this.error);
}

class ShopLoadingUserDataState extends ShopStates {}

class ShopSuccessUserDataState extends ShopStates {

  //TODO Add ShopLoginModel

//  final ShopLoginModel loginModel;
//
//  ShopSuccessUserDataState(this.loginModel);
}

class ShopErrorUserDataState extends ShopStates {
  final String error;

  ShopErrorUserDataState(this.error);
}

class ShopLoadingUpdateUserState extends ShopStates {}

class ShopSuccessUpdateUserState extends ShopStates {

  //TODO Add ShopLoginModel
//
//  final ShopLoginModel loginModel;
//
//  ShopSuccessUpdateUserState(this.loginModel);
}

class ShopErrorUpdateUserState extends ShopStates {
  final String error;

  ShopErrorUpdateUserState(this.error);
}
class SearchInitialState extends ShopStates{}

class SearchLoadingState extends ShopStates{}

class SearchSuccessState extends ShopStates{}

class SearchErrorState extends ShopStates{
  final String error;

  SearchErrorState(this.error);
}

class AddProductState extends ShopStates{
}
class DeleteProductState extends ShopStates{

}
class PlusProductState extends ShopStates{
}
class MinusProductState extends ShopStates{
}
class LoadingState extends ShopStates{
}
class ChangeFavoritesState extends ShopStates{
}
class AddOrderState extends ShopStates{
}
class AddWholesalerOrderState extends ShopStates{
}
class DeleteWholesalerUserFromShopState extends ShopStates{
}



