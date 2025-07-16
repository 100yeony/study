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


# Git 명령어
```bash
# 원격지에 잘못 올라간 커밋 하나 삭제하기(원격지 커밋 히스토리에서도 삭제)
git reset --hard HEAD~1
git push origin {branch_name} --force
```

```bash
# 로컬 커밋 하나 지우기(변경사항은 작업디렉토리에 유지)
git reset HEAD~1
```

```bash
# 원격지에 잘못 올린 디렉토리 삭제하고 gitignore에 추가하기
# git index에서만 삭제. 로컬에는 유지됨
git rm -r --cached {bad_folder}
git commit -m "remove bad folder"
# git ignore 수정
git push origin {branch_name}
```

### git branch 삭제
```bash
# 로컬에서 삭제
git branch -d {branch_name}
# 원격지에서도 삭제
git push origin -d {branch_name}
```

