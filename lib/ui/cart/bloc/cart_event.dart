abstract class CartEvent{}

class AddToCartEvent extends CartEvent {
  int productId,quantity;
  AddToCartEvent({required this.productId,required this.quantity});
}

class FetchCartEvent extends CartEvent {}
