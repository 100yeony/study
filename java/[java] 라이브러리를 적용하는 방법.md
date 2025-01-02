자바 프로젝트에서 라이브러리를 적용하는 방법에는 maven, gradle과 같은 빌드 도구를 이용하는 방법과 수동으로 라이브러리를 추가하는 방법이 있다.

## maven을 사용하여 라이브러리 추가
    maven은 자바 프로젝트의 의존성을 관리하는 도구
    pom.xml의 <dependencies> 태그 안에 라이브러리 의존성을 추가하여 사용할 수 있다.
    ```
    <dependencies>
        <dependency>
            <groupId>group-id</groupId>
            <artifactId>artifact-id</artifactId>
            <version>version</version>
        </dependency>
    </dependencies>
    ```
    

## gradle을 사용하여 라이브러리 추가
    build.gradle 파일을 열고 dependencies 블록 내에 사용할 라이브러리 의존성을 추가한다.
    ```
     dependencies {
        implementation 'group-id:artifact-id:version'
    }
    ```
   

## JAR 파일 직접 추가(수동 라이브러리 관리)
    1. 라이브러리 jar 파일 다운로드
        공식 웹 사이트나 maven central repository에서 다운로드
    2. 프로젝트에 jar 파일 추가
        다운로드한 jar 파일을 프로젝트의 lib 폴더에 넣는다. 폴더가 없다면 생성한다.
    3. IDE에서 jar 파일 설정
        intellij: File > ProjectStructure > Libraries > + 버튼 클릭 후 jar 파일 추가