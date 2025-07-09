# python uv 가상환경 세팅

uv는 패키지 설치 속도가 매우 빠르지만 최근에 나와서 오류가 있을 수 있음. 
pyproject.toml 기반 프로젝트에 최적화된 도구임

## uv 설치
```
brew install uv
uv python install 3.11
uv venv --python=3.11
```

## 가상환경 활성화
```
source .venv/bin/activate
```

## pyproject.toml 에 있는 라이브러리 설치
```
uv sync
```

## uv 라이브러리 추가 설치 (uv add)
```
uv add python-dotenv langchain-cli "langserve[all]>=0.0.30" 
uv add "pydantic>=2.0.0,<2.8.0"
```


## 주피터 노트북이 안돌아가서 다음과 같은 오류 발생. 
```
'platform-chatbot (Python 3.11.13)'(으)로 셀을 실행하려면 ipykernel 패키지가 필요합니다.
'ipykernel'을(를) Python 환경에 설치합니다.
명령: '/Users/yh/ktds/platform-chatbot/.venv/bin/python -m pip install ipykernel -U --force-reinstall
```

## 해결: 가상환경 내부에서 pip 다시 설치해주고 라이브러리 다운받음. 
```
python -m ensurepip
python -m pip install --upgrade pip
python -m pip install ipykernel
```