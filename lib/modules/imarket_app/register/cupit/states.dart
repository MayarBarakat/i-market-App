
abstract class ShopRegisterStates{}

class ShopRegisterInitialState extends ShopRegisterStates{}

class ShopRegisterLoadingState extends ShopRegisterStates{}

class ShopRegisterSuccessState extends ShopRegisterStates{
}

class EditUserDataState extends ShopRegisterStates{
}

class ShopRegisterErrorState extends ShopRegisterStates{
  final String error;

  ShopRegisterErrorState(this.error);
}

class ShopRegisterChangePasswordVisibilityState extends ShopRegisterStates{}
class DeleteUserState extends ShopRegisterStates{}
class DeleteWholesalerUserState extends ShopRegisterStates{}
class LoginState extends ShopRegisterStates{}
class ShopChangePasswordVisibilityState extends ShopRegisterStates{}