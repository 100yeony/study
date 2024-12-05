## inject와 autowired 라이브러리
	- import jakarta.inject.Inject는 @Inject로 사용될 수 있으며 jakarta EE에서 제공하는 라이브러리이다. 의존성 주입을 목적으로 사용된다. (의존성 주입 = DI, Dependency injection) -> 객체가 필요로하는 다른 객체를 직접 생성하거나 찾는 대신 Spring 컨테이너가 의존성을 주입함.
	- 예제) DI를 사용하지 않는 경우 - UserService와 User Repository 간의 강한 결합이 형성되어 있음. 코드 변경 시 여러 클래스에 영향을 줄 수 있고 유지보수성이 떨어짐. 
public class UserService {
    private UserRepository userRepository;

    public UserService() {
        this.userRepository = new UserRepository(); // 직접 생성
    }
    
    // ...
}

	- DI를 사용한 경우 - 1. Constructor Injection: 생성자를 통해 의존성을 주입하는 방식. 클래스의 생성자를 정의하고 의존하는 객체를 매개변수로 받아 필드에 할당. 
public class UserService {
    private UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
    
    // ...
}

	- DI를 사용하는 경우 2. Setter injection : Setter 메서드를 통해 의존성을 주입.
public class OrderService {
    private PaymentGateway paymentGateway;

    @Autowired
    public void setPaymentGateway(PaymentGateway paymentGateway) {
        this.paymentGateway = paymentGateway;
    }
    
    // ...
}


	- DI를 사용하는 경우. 3. Field Injection: 필드에 직접 의존성을 주입. 
@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;
    
    // ...
}

	- DI를 사용하는 경우 4. Method Injection: 메서드의 매개변수로 의존성을 주입

@Component
public class ReportGenerator {
    private EmailService emailService;

    @Autowired
    public void setEmailService(EmailService emailService) {
        this.emailService = emailService;
    }
    
    public void generateReport() {
        // Use the emailService here...
    }
}

	- Spring framework의 @Autowired와 같은 역할을 한다.
		○ Spring 컨테이너가 클래스의 인스턴스를 자동으로 필요한 객체를 주입해준다. 
		○ Spring의 IoC(Inversion of Control) 컨테이너의 강력한 기능 중 하나로 효과적으로 의존성을 관리할 수 있게 해줌 -> 제어의 역전(IoC)
			§ Bean Factory: 필요한 빈(객체)를 요청할 때마다 생성. 주로 메모리 사용이 제한된 환경에서 사용
			§ ApplicationContext: BeanFactory의 기능을 포함하고 있으며 일반적으로 더 많이 사용됨. 대부분의 Spring 애플리케이션은 Application Context를 사용
			§ 제어의 역전(Inversion of Control) : 전통적 프로그래밍에서는 개발자가 프로그램의 흐름과 제어를 관리하는 반면에 IoC는 프레임워크가 객체의 생성, 관리, 제어 흐름을 담당하도록 변경. Spring에서는 이를 지원하기 위해 Applicaton Context라는 컨테이너를 제공한다. Application Context는 애플리케이션의 컴포넌트를 생성하고 조립하며, 객체의 라이프사이클을 관리.
이 어노테이션을 사용하면 주입된 객체가 컨테이너에 의해 관리된다. 객체의 생성, 소멸, 스코프 관리 등을 컨테이너가 담당하게 됨으로써 개발자가 이러한 관리를 하지 않아도 된다.