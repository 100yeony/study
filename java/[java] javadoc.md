JDK 최신 버전들은 모두 Javadoc을 제공하여
API를 편리하게 문서화할 수 있도록 지원

# Javadoc을 사용하는 이유
    주석만으로도 편리하게 API를 문서화할 수 있기 때문

# Javadoc을 사용하기 위한 전제 조건
    1. JDK 1.4 이상
    2. PATH 환경변수에 JDK의 /bin 폴더가 추가
    3. IDE(선택사항)


# Java에서 사용할 수 있는 주석 방식
    1. 
    // single line comment

    2. 
    /*
     * regular multi-line comment
     */

    3. 
    /**
     * javadoc
     */

    Javadoc을 사용하려면 3번 방식을 사용해야 함.

    Javadoc은 문서화하려는 Class 및 method 혹은 필드 위에 배치할 수 있다.
    Javadoc은 일반적으로 두가지 섹션으로 구성된다.
        1. 우리가 문서화하려는 것에 대한 설명
        2. 특정 메타 데이터를 설명하기 위해 @이 들어간 독립형 블록 태그


# Javadoc 예시
    (1)
    /**
    * This class is implementation Class of ToyFactory
    * @see tommy.toyproject.javadoc.ToyFactory
    * @author tommy
    */
    public class ToyFactoryImpl implements ToyFactory{
            (2)
        /**
        * name of Toy Factory
        */
        public String toyFactoryName;

        (3)
        /**
        * this method is for make Toy
        * @param name name of Toy
        * @return the name of toy
        */
        @Override
        public String makeToy(String name) {
            return name + "toy is made";
        }
            (4)
        /**
        * this method is for sale Toy
        * @param name name of Toy
        * @return Sentence for sold toy
        */
        @Override
        public String sellToy(String name) {
            return name + "toy was sold";
        }
    }

    (1)은 class를 설명하기 위한 Javadoc 예시입니다.

    @see의 경우 참조를 가리키는 링크 혹은 텍스트 항목을 작성할 수 있는 독립형 블록 태그입니다.
    @author의 경우 Javadoc comment를 작성한 사람을 적을 때 사용합니다.

    (2)는 필드값을 설명할 때 사용합니다.

    (3)과 (4) 는 method를 설명할 때 사용합니다.

    @param에는 메서드의 변수를 적으면 됩니다.
    작성 형식 : @param {변수명} {변수에 대한 설명}
    @return에는 메서드가 반환하는 것에 대해 설명을 적으면 됩니다.


# Javadoc 생성하는 방법
    intellij에서 gradle을 사용하는 경우
    코끼리 아이콘 클릭 > Tasks > documentation > javadoc 실행

    실행 후에 directory 폴더에서 build > docs > index.html 클릭하면 javadoc 문서를 확인할 수 있다.