# DataSource
- DB와의 연결을 미리 생성하고, 관리하는 역할을 하는 오브젝트
- DB Connection을 관리하는 인터페이스
- getConnection()등의 메소드를 지원, JPA 등 툴들은 해당 메소드를 통해 DB Connection을 가져와 사용하고 반납한다.

# JNDI(Java Naming and Directory Interface)
- Java 애플리케이션에서 자원에 접근하기 위해 사용하는 API. 웹 애플리케이션 서버와 같은 환경에서는 데이터베이스 커넥션 풀과 같은 리소스를 JNDI에서 등록하여 관리할 수 있음. 
- Spring Framework에서 데이터 소스를 정의하는 방식임. 

web.xml과 server.xml에 다음의 내용 추가
ex.
```
....web.xml
<resource-ref>
    <description>Resource</description>
    <res-ref-name>jdbc/EmployeeDB</res-ref-name>
    <res-type>javax.sql.DataSource</res-type>
    <res-auth>Container</res-auth>
</resource-ref>

...server.xml
<Resource name="jdbc/EmployeeDB"
          auth="Container"
          type="javax.sql.DataSource"
          username="dbusername"
          password="dbpassword"
          driverClassName="driverName"
          url="jdbc:oracle:thin..."
          maxActive="8"
          maxIdle="4"/>
 ```


ex. 실제 DB와 연결하는 코드는 다음과 같음.
```InitialContext initCtx = new InitialContext();
DataSource ds = (DataSource) initCtx.lookup("java:comp/env");```


# Spring Boot 에서 DB 설정 방식
pom.xml(maven) 또는 build.gradle(gradle)에 의존성 추가
ex. mysql을 사용할 경우
```<dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
</dependency>```

또는 데이터 소스 관련 자동 구성으로 할 수 있음.
spring-boot-starter-data-jpa 와 같은 스타터를 의존성으로 추가하면 spring boot는 다음 설정을 찾아 자동으로 데이터 소스를 구성함.

ex. application.yml에 DB 설정 정보를 작성
```spring:
  datasource:
    url: jdbc:mysql://localhost:3306/mydb
    username: myuser
    password: mypassword
    driver-class-name: com.mysql.cj.jdbc.Driver```


ex. 코드 상에서 사용하기.
```public Optional<List<User>> findAll() {
    List<User> Users = new ArrayList<>();
    try {
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(SELECT_ALL_SQL);
        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            mapToUser(users, resultSet);
        }
    }
    catch (SQLException e) {
        throw new RuntimeException(e);
    }

    return Optional.of(Users);
}
```