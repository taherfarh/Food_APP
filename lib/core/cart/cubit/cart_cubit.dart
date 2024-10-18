import 'package:bloc/bloc.dart';

import 'package:food_application/core/cart/cubit/cart_state.dart';
import 'package:food_application/data/models.dart';
import 'package:meta/meta.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<Userdata> cartItems = [];

  void addToCart(Userdata product) {
    cartItems.add(product);
    emit(CartUpdated(cartItems: cartItems));
  }

  void removeFromCart(Userdata product) {
    cartItems.remove(product); // Remove the product from the list
    emit(CartUpdated(cartItems: cartItems)); // Emit the updated state
  }
}
