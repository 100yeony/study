# X-Forwarded-For(XFF) 헤더
- HTTP 요청 헤더 중 하나
- 클라이언트 IP를 식별하는데 사용됨
- 일반적으로 클라이언트가 프록시 서버나 로드밸런서를 거치는 경우, 웹 서버는 클라이언트 IP가 아닌 프록시 서버 or LB의 ip를 받게 됨
- 클라이언트 IP를 식별해야 하는 경우, 프록시 서버나 로드밸런서가 이 헤더를 추가하여 클라이언트 ip를 전달할 수 있음
- ex. X-Forwarded-For: client_ip, proxy1_ip, proxy2_ip