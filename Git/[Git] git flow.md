# feature 브랜치 시작하기
develop의 원격 소스를 로컬 소스로 현행화하기
```bash
develop$ git pull origin develop
```


develop 브랜치에서 feature 브랜치 생성
```bash
develop$ git flow feature start {브랜치명}
```

# feature 브랜치 종료하기
로컬 feature 브랜치로 작업 내용 저장하기
```bash
git add .
git commit -m "커밋 메시지"
```

로컬 feature 브랜치 종료하기
```bash
git flow feature finish {브랜치명}
```

feature가 종료(삭제)되고 develop 브랜치로 소스가 병합됨(로컬에만 반영)

git push하여 원격 저장소에 반영
```bash
develop$ git push origin develop
```

만약 다음과 같은 오류 발생시 
```
"Branches 'develop' and 'origin/develop' have diverged. Fatal: And branch 'develop' may be fast-forwarded."
```

로컬 develop 브랜치 내용과 원격지 내용이 달라서 오류가 발생함. 
원격지 내용으로 로컬을 업데이트

develop 브랜치로 이동
```bash
git checkout develop
git pull origin develop
```

다시 feature 브랜치로 돌아가서 종료하기
```bash
git checkout feature/branch_name
```


