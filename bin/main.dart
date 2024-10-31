import 'dart:io';
import 'package:sparta_2w_console_shopping_mall/product.dart';
import 'package:sparta_2w_console_shopping_mall/shoppingmall.dart';

void main() {
  // 샘플 상품 목록 생성
  List<Product> productList = [
    Product(name: '셔츠', price: 45000),
    Product(name: '원피스', price: 30000),
    Product(name: '반팔티', price: 35000),
    Product(name: '반바지', price: 38000),
    Product(name: '양말', price: 5000),
  ];

  ShoppingMall mall = ShoppingMall(productList);

  bool running = true;

  while (running) {
    print('[1] 상품 목록 보기');
    print('[2] 장바구니에 담기');
    print('[3] 장바구니에 담긴 상품의 총 가격 보기');
    print('[4] 프로그램 종료');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        mall.showProducts();
        break;

      case '2':
        print('담고 싶은 상품 이름을 입력하세요:');
        String? productName = stdin.readLineSync();
        print('상품 개수를 입력하세요:');
        String? quantityInput = stdin.readLineSync();

        try {
          int quantity = int.parse(quantityInput!);
          mall.addToCart(productName!, quantity);
        } catch (e) {
          print('입력값이 올바르지 않아요 !');
        }
        break;

      case '3':
        mall.showTotal();
        break;

      case '4':
        print('이용해 주셔서 감사합니다 ~ 안녕히 가세요 !');
        running = false;
        break;

      default:
        print('지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..');
    }
  }
}
