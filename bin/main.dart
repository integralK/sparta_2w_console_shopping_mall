import 'dart:io'; // Dart의 I/O 라이브러리를 가져와 사용자 입력을 받을 수 있도록 함
import 'package:sparta_2w_console_shopping_mall/shoppingmall.dart'; // ShoppingMall 클래스를 정의한 파일을 가져옴

void main() {
  ShoppingMall mall = ShoppingMall(); // 쇼핑몰 객체 생성
  bool isRunning = true; // 프로그램 실행 여부를 나타내는 변수

  while (isRunning) {
    // 사용자에게 선택지를 보여줍니다.
    print(
        '--------------------------------------------------------------------------------------------------------------------------------------------------------');
    print(
        '[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료 확인 / [5] 프로그램 종료 / [6] 장바구니 내용 보기');
    print(
        '--------------------------------------------------------------------------------------------------------------------------------------------------------');

    String? choice = stdin.readLineSync(); // 사용자 입력

    switch (choice) {
      case '1':
        mall.showProducts(); // 상품 목록 출력
        break;
      case '2':
        mall.addToCart(); // 장바구니에 상품 추가
        break;
      case '3':
        // 장바구니에 담긴 상품 목록과 총 금액 출력
        if (mall.isCartEmpty()) {
          print("장바구니에 담긴 상품이 없습니다."); // 장바구니가 비어있을 경우 처리
        } else {
          mall.showCart(); // 장바구니 내용 출력
        }
        break;
      case '4':
        print("정말 종료하시겠습니까? (5 입력 시 종료, 다른 값 입력 시 계속)"); // 종료 확인 메시지 출력
        String? confirmation = stdin.readLineSync(); // 사용자 입력 받기
        if (confirmation == '5') {
          isRunning = false; // 프로그램 종료
          print("이용해 주셔서 감사합니다 ~ 안녕히 가세요!"); // 종료 메시지 출력
        } else {
          print("종료하지 않습니다."); // 종료하지 않음을 알림
        }
        break;
      case '5':
        // 5를 입력하면 프로그램을 종료합니다.
        isRunning = false; // 프로그램 종료
        print("이용해 주셔서 감사합니다 ~ 안녕히 가세요!"); // 종료 메시지 출력
        break;
      case '6':
        // 장바구니 내용 보기
        if (mall.isCartEmpty()) {
          print("장바구니에 담긴 상품이 없습니다."); // 장바구니가 비어있을 경우 처리
        } else {
          mall.showCart(); // 장바구니 내용 출력
        }
        break;
      default:
        print("지원하지 않는 기능입니다 ! 다시 시도해 주세요 .."); // 잘못된 입력 처리
    }
  }
}
