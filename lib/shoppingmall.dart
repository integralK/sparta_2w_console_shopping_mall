import 'Product.dart'; // Product클래스가 더 큰 범위라 여기에만 import하면 되는것 같음?
import 'dart:io';

class ShoppingMall {
  // 판매하는 상품 목록과 장바구니의 총 가격을 속성으로 가진다.
  List<Product> products = []; // 상품 목록을 담는 리스트
  int total = 0; // 장바구니의 총 가격
  List<String> cartItems = []; // 장바구니에 담긴 상품 이름 목록

  // 생성자: 초기 상품 목록을 추가
  ShoppingMall() {
    // products 리스트에 Product 객체를 추가
    products
        .add(Product(name: '셔츠', price: 45000)); // '셔츠'라는 이름의 상품을 45000원에 추가
    products
        .add(Product(name: '원피스', price: 30000)); // '원피스'라는 이름의 상품을 30000원에 추가
    products
        .add(Product(name: '반팔티', price: 35000)); // '반팔티'라는 이름의 상품을 35000원에 추가
    products
        .add(Product(name: '반바지', price: 38000)); // '반바지'라는 이름의 상품을 38000원에 추가
    products.add(Product(name: '양말', price: 5000)); // '양말'이라는 이름의 상품을 5000원에 추가
    // add 메서드는 리스트에 새로운 요소를 추가하는 데 사용

    /* 처음엔 "Too many positional arguments: 0 expected, but 2 found. 
    Try removing the extra positional arguments, or specifying the name for named arguments."라고 에러 뜸.
    Product 클래스 생성자에서 named parameters를 사용한 경우(required this.name처럼) 
    생성자 정의를 유지하고 객체를 생성할 때 인자의 이름을 명시해 호출해야 한다.
    그래서 상품이름과 가격앞에 name:과 price:라고 named arguments를 사용해서 호출하니 에러 사라짐.
    */
  }

// 장바구니가 비어있는지 확인하는 메서드
  bool isCartEmpty() {
    return total == 0; // total이 0이면 장바구니가 비어있음
  }

  // 상품 목록을 출력하는 메서드
  void showProducts() {
    print("판매하는 상품 목록:"); // 목록 출력 전의 설명
    for (var product in products) {
      // products 리스트를 순회하며 각 상품을 출력
      print('${product.name} / ${product.price}원'); // 상품 이름과 가격 출력
    }
  }

  // 장바구니에 상품을 추가하는 메서드
  void addToCart() {
    print("장바구니에 담을 상품 이름을 입력하세요:"); // 사용자에게 상품 이름 입력 요청
    String? productName =
        stdin.readLineSync(); // 사용자가 입력한 상품 이름을 저장 (개념적 이해가 더 필요한 부분. 대혼란)

    print("몇 개를 담으시겠습니까?"); // 사용자에게 상품 개수 입력 요청
    int quantity = 0; // 개수를 저장할 변수 초기화

    try {
      // 사용자가 입력한 값을 정수로 변환
      quantity = int.parse(stdin.readLineSync()!); // 입력값을 int 타입으로 변환
    } catch (e) {
      // 변환 중 오류가 발생한 경우
      print("입력값이 올바르지 않아요!"); // 오류 메시지 출력
      return; // 잘못된 입력 시 메서드를 종료
    }

    // 입력한 상품 이름으로 상품 찾기
    Product product = products.firstWhere(
      (p) => p.name == productName,
      orElse: () =>
          Product(name: '존재하지 않는 상품', price: 0), // named parameters 사용
      /// 원래는 orElse 뒷부분에 null을 넣어보려고 했으나, 계속 뜨는 에러에 대해 해결하지 못함. 공부 필요!
    );

    if (product.name == '존재하지 않는 상품') {
      // 이 부분도 null사용 실패!
      print("입력값이 올바르지 않아요!"); // 잘못된 상품 입력 처리
      return; // 메서드를 종료
    }

    // 사용자가 입력한 개수가 0 이하인 경우
    if (quantity <= 0) {
      print("0개보다 많은 개수의 상품만 담을 수 있어요!"); // 오류 메시지 출력
      return; // 메서드를 종료
    }

    // 장바구니에 상품을 추가
    total += product.price * quantity; // 총 가격에 상품 가격 * 개수를 더함
    cartItems.add('${product.name} ($quantity개)'); // 장바구니에 담긴 상품 이름과 개수를 저장
    print("장바구니에 상품이 담겼어요!"); // 성공 메시지 출력
  }

  // 장바구니의 총 가격을 출력하는 메서드
  void showTotal() {
    if (total == 0) {
      // 장바구니가 비어있다면
      print("장바구니에 담긴 상품이 없습니다."); // 메시지 출력
    } else {
      print("장바구니에 $total원 어치를 담으셨네요!"); // 총 가격 출력
    }
  }

  // 장바구니 초기화 메서드
  void clearCart() {
    if (total > 0) {
      total = 0; // 총 가격을 0으로 초기화
      cartItems.clear(); // 장바구니 목록을 비운다.
      print("장바구니를 초기화합니다."); // 성공 메시지 출력
    } else {
      print("이미 장바구니가 비어있습니다."); // 장바구니가 비어있을 경우 메시지 출력
    }
  } // "장바구니를 초기화합니다."가 2번 출력됨. 무엇이 문제인지 공부 및 해결 필요!

  // 장바구니의 내용을 보여주는 메서드
  void showCart() {
    if (cartItems.isEmpty) {
      // 장바구니가 비어있다면
      print("장바구니에 담긴 상품이 없습니다."); // 메시지 출력
    } else {
      print(
          "장바구니에 ${cartItems.join(', ')} 담겨있네요. 총 $total원 입니다!"); // 장바구니 내용과 총 가격 출력
    }
  }
}
