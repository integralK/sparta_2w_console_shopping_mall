class Product {
  String name; // late를 사용하지 않음
  int price; // late를 사용하지 않음

  Product({required this.name, required this.price}); // 생성자 매개변수로 직접 초기화
}

/* 
위의 코드에서는 late를 사용하지 않고 name과 price를 선언. 
대신, 생성자에서 {required this.name, required this.price}로 직접 초기화.
이렇게 하면 initializing formal 경고를 피할 수 있으며, 모든 필드는 생성자 호출 시 반드시 초기화된다.
*/