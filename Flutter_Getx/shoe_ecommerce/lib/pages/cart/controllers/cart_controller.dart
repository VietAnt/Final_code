import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoe_ecommerce/network/models/cart_item.dart';
import 'package:shoe_ecommerce/network/models/shoe.dart';

class CartController extends GetxController {
  RxList<CartItem> items = <CartItem>[].obs;
  RxDouble total = 0.0.obs;

  //addToCart: Thêm vào giỏ hàng
  void addToCart(Shoe shoe) {
    for (var item in items) {
      if (item.shoe.id == shoe.id) {
        items[items.indexOf(item)].quantity += 1;
        return;
      }
    }
    items.add(CartItem(shoe: shoe));
    calTotal();
    update();
  }

  //addQuantity: Thêm số lượng
  void addQuantity(CartItem item) {
    item.quantity++;
    update();
  }

  //lowQuantity: Xóa số lượng
  void lowQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      items.remove(item);
    }
    calTotal();
    update();
  }

  //calTotal: Tổng tiền
  void calTotal() {
    total.value = 0;
    for (var item in items) {
      total.value += item.shoe.price * item.quantity;
    }
  }
}
