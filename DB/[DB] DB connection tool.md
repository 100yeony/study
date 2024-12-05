## DB connection
	- DataSource
		○ DB나 파일과 같은 물리적 데이터 소스에 연결할 때 사용하는 인터페이스
		○ 구현체는 각 vendor 사에서 제공 
		○ DataSource를 사용하면 Connection Pool을 활용할 수 있음 
		○ 애플리케이션 코드를 직접 수정하지 않고 properties로 DB 연결을 변경할 수 있고 분산 트랜잭션도 사용 가능
	- HikariCP
		○ 스프링부트 2.0부터 HikaryCP를 기본 DataSource로 채택하고 있음. 
		○ HikaryCP는 빠르고 간편하며 오버헤드가 제로
