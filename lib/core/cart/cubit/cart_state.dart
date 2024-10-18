
import 'package:food_application/data/models.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CartState {}

final class CartInitial extends CartState {}

final class CartUpdated extends CartState {
  final List<Userdata> cartItems;

  CartUpdated({required this.cartItems});

  // Ensure immutability by returning a new instance when modifying the cartItems
  CartUpdated copyWith({List<Userdata>? cartItems}) {
    return CartUpdated(
      cartItems: cartItems ?? this.cartItems,
    );
  }
}
