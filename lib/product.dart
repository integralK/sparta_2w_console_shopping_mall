class Product {
  // 상품의 이름과 가격을 속성으로 가진다.
  String name; // 상품이름. late를 사용하지 않음
  int price; // 상품가격. late를 사용하지 않음

  Product({required this.name, required this.price}); // 생성자:상품 이름과 가격을 초기화
}

/* 
* 원래는 late를 사용하지 않고 name과 price를 선언하는 대신, 
생성자에서 {required this.name, required this.price}로 직접 초기화.
이렇게 하면 initializing formal 경고를 피할 수 있으며, 모든 필드는 생성자 호출 시 반드시 초기화된다.

* shoppingmall.dart에서 상품 목록에서 생성자의 호출에 문제가 있음을 나타내는
"Too many positional arguments: 0 expected, but 2 found. 
Try removing the extra positional arguments, or specifying the name for named arguments." 에러 뜸.

* Product 생성자는 named parameters를 사용하기 때문에, 객체를 생성할 때 아래와 같이 인자의 이름을 명시해야 한다.
상품 목록의 "products.add(Product('셔츠', 45000));"" 형식에서 
"products.add(Product(name: '셔츠', price: 45000));" 형식으로 named parameters 사용.
아니라면 위에 첫번째 형식으로 쓰고 required도 빼면 된다?
*/