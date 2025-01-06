# git tag
git tag는 의미있는 특정 시점을 Snapshot 형태로 기록하는 방법.
tag는 만든 이후에는 수정이 불가능함.
read only 상태
tag를 이용하여 특정 시점으로 롤백하거나, 배포 버전을 생성하는 등의 용도로 사용됨.

# 특정 tag 적용하기
git checkout tags/[TAG_NAME]

# tag 생성
git tag -a [TAG_NAME] -m "[MESSAGE]"
ex) git tag -a v1.0 -m "init tag 20241227 deploy"

# tag를 원격지에 푸시
git push -u origin [TAG_NAME]
ex) git push -u origin v1.0

# tag pull
전체 tag 내려받기
git fetch --all --tags

# tag 수정
tag는 그 자체로 수정이 불가능하기 때문에 branch를 생성한 뒤 수정이 가능하다.

특정 태그로 브랜치 생성하기
git checkout tags/[TAG_NAME] -b [BRANCH_NAME]

# tag 삭제
태그를 사용 중인 브랜치를 먼저 삭제한다.
git branch -d [BRANCH_NAME]
ex) git branch -d local-v1.0

로컬 태그 삭제
git tag -d [TAG_NAME]
ex) git tag -d v1.0

원격지 태그 삭제
git push -u origin :tags/[TAG_NAME]
ex) git push -u origin :tags/v1.0