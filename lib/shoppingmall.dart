import 'product.dart';

class ShoppingMall {
  List<Product> products;
  int totalPrice;

  ShoppingMall(this.products) : totalPrice = 0;

  void showProducts() {
    for (var product in products) {
      print('${product.name} / ${product.price}원');
    }
  }

  void addToCart(String productName, int quantity) {
    var product = products.firstWhere((p) => p.name == productName,
        orElse: () => throw Exception('상품이 없습니다.'));
    if (quantity > 0) {
      totalPrice += product.price * quantity;
      print('장바구니에 상품이 담겼어요 !');
    } else {
      print('0개보다 많은 개수의 상품만 담을 수 있어요 !');
    }
  }

  void showTotal() {
    print('장바구니에 $totalPrice원 어치를 담으셨네요 !');
  }
}
