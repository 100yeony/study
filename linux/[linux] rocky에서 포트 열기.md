# 방화벽 포트 개방
	firewall-cmd --permanent --add-port=2222/tcp

# 방화벽 정책 리로드
	firewall-cmd --reload

# 방화벽 정책 확인
	firewall-cmd --list-all
	$ services: cockpit dhcpv6-client ssh
	$ ports: 22/tcp 2222/tcp