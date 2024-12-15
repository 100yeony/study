# IoC(Inversion of Control, 제어의 역전)
    애플리케이션 흐름의 주도권을 Spring이 갖는다.

    프레임워크와 라이브러리의 가장 큰 차이점은 애플리케이션 흐름의 제어권(주도권)에 있다.
    라이브러리는 애플리케이션 흐름의 주도권이 개발자에게 있지만
    프레임워크는 애플리케이션 흐름의 주도권이 프레임워크에 있다.

    IoC(제어의 역전)이란 애플리케이션 흐름의 주도권이 뒤바뀐 것을 의미한다.
    프레임워크 API를 사용하게 되면서 설정 파일을 통해 객체의 생명 주기, 클래스 등의 제어권을 프레임워크가 갖게 됨. 
    스프링의 가장 핵심적인 기능으로 객체의 생명주기를 관리하고 의존성 주입(DI)를 통해 각 계층이나 서비스 간의 의존성을 맞춰준다.

    자바 콘솔 애플리케이션의 경우 main() 메서드가 종료되면 실행이 종료된다.
    하지만 웹에서 동작하는 애플리케이션은 클라이언트가 외부에서 접속하여 사용하는 서비스이기 때문에 main() 메서드가 종료되지 않아야 한다.

    하지만 서블린 컨테이너에는 서블릿 클래스만 존재하며 별도의 main 메서드가 존재하지 않는다.
    서블릿 컨테이너는 클라이언트 요청이 들어올 때마다 컨테이너 내의 로직(service 메서드)이 서블릿을 직접 실행시켜 주기 때문에 main 메서드가 필요없다. 

    이런 경우 서블릿 컨테이너가 서블릿을 제어하기 때문에 애플리케이션 주도권은 서블릿 컨테이너에 있다.

    Spring에서는 IoC 개념을 적용시키기 위해 DI(의존성 주입)을 사용한다.

# DI(Dependency Injection, 의존성 주입)
    DI는 IoC 개념을 구체화시킨 것.
    객체지향 프로그래밍에서 객체 간의 의존 관계를 느슨하게 해주는 것.

# 의존성이란?
    A, B 클래스가 존재할 때
    A 클래스에서 B 클래스의 메서드를 호출하는 경우
    A 클래스는 B 클래스에 의존한다.


# DI 예시
public class Client {
    public static void main(String[] args) {
        MenuService menuService = new MenuService();
        MenuController controller = new MenuController(menuService); // 의존성 주입
        List<Menu> menuList = controller.getMenus();
    }
}

public class MenuController {
    private MenuService = menuService;

    // 생성자의 파라미터를 MenuService의 객체로 입력받음
    public MenuController(MenuService menuService) { 
        this.menuService = menuService;
    }

    public List<Menu> getMenus() {
        return menuService.getMenuList();
    }
}

public class MenuService {
    public List<Menu> getMenuList() {
        return null;
    }
}

MenuService의 기능을 사용하기 위해 MenuController 생성자로 MenuService 객체를 전달받고 있다.
생성자 파라미터로 객체를 전달하는 것 == 외부에서 객체를 주입하는 것
외부는 Client 클래스가 MenuController의 생성자 파라미터로 menuService 객체를 전달하고 있기 때문에 객체를 주입해주는 외부가 됨.

# DI를 사용하는 이유
    new 연산자를 사용하여 의존 객체를 생성하는 것을 강한 결합(Tight Coupling)이라고 함.
    의존성 주입을 하더라도 클래스 간의 강한 결합은 피하는게 좋다.
    느슨한 결합(Loose Coupling)이 필요하다.
    -> 인터페이스를 사용하면 됨.