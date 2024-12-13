## tomcat 구성
	- coyote(http component) : 톰캣에 tcp 통한 프로토콜 지원
	- catalina(servlet container):  java servlet을 호스팅하는 환경
	- jasper(jsp engine) : jsp 페이지의 요청을 처리하는 서블릿

http 요청을 받으면 coyote가 받아서 catalina에 전달
catalina는 전달받은 http 요청을 처리할 웹 애플리케이션을 찾고 web.xml을 참조해서 요청을 전달한다.
요청된 servlet을 통해 생성된 jsp가 있다면 jasper가 검증/ 컴파일 등을 수행한다.


## embeded tomcat /내장톰캣
	- tomcat의 기능을 최적화하여 스프링 부트 애플리케이션에 적합하게 만들기 위해 tomcat의 컴포넌트를 분리해 별도의 라이브러리로 만듦
		○ tomcat embeded core
		○ tomcat embeded jasper
		○ tomcat embeded logging JULI
		○ tomcat embeded websocket
		○ tomcat embeded EL
		○ tomcat embeded logging log4j

## 내장 톰캣, 외장 톰캣 차이
	- 애플리케이션 실행 방법의 차이
	- 내장 톰캣 : build된 스프링부트 애플리케이션 jar, war를 java 명령어로 실행 (보통 application.properties / yml에 구성)
	- 외장 톰캣 (보통 server.xml에 구성)
		○ tomcat을 설치
		○ tomcat 설정 파일 구성
		○ tomcat webapp 디렉토리에 build된 스프링 애플리케이션 war 파일을 포함시켜줌
        tomcat을 실행