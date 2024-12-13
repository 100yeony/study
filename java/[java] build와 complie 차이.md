## build와 complie 차이
	- compile
		○ 소스 코드를 바이너리 코드로 변환하는 과정
		○ 프로그래밍 언어로 작성된 소스 코드를 컴퓨터가 이해할 수 있는 기계어로 번역함
	- build 
		○ 소스 코드 파일을 실행 가능한 소프트웨어 산출물로 변환하는 과정
		○ 이 과정에서 소스 코드 파일을 컴파일하고, 실행 파일이나 라이브러리 파일 등을 생성
		○ 컴파일 이후에 발생하는 과정으로, 컴파일 과정과 함께 빌드 과정을 수행

	- 과정
		○ 다음의 자바 언어로 작성된 코드를 빌드하고 실행하는 과정
		// Hello.java
		public class Hello {
		  public static void main(String[] args) {
		    System.out.println("Hello, World!");
		  }
		}
			i. 소스 코드를 컴파일러에 의해 컴파일
			ii. 컴파일러가 생성한 바이트 코드(.class 파일)을 실행 파일(.jar, .war)로 패키징
			iii. 실행 파일(.jar, .war)을 실행하여 결과를 출력
				
		○ 아래는 자바로 작성된 코드를 빌드하고 실행하는 과정을 명령어로 수행하는 예시
		# 소스 코드 컴파일
		$ javac Hello.java
		
		# 패키징
		$ jar cvfe Hello.jar Hello Hello.class
		
		# 실행
		$ java -jar Hello.jar
		Hello, World!
		
