Rocky OS에 Nvidia 그래픽카드 삭제 후 재설치하기.


# 그래픽드라이버 삭제하기 전에 secure모드 비활성화
재부팅하고 f10 눌러서 부팅모드 들어가서 
Secure boot configuration에 비활성화 되어있는지 확인


# Gui 모드 내림
Systemctl set-default multi-user.target

# Gui 모드 복구하기(그래픽카드가 설치되어 있어야 복구도 됨)
Systemctl set-default graphical.target
systemctl get-default
systemctl isolate graphical.target
Reboot

# Nvidia 프로세스 죽이기 (https://blog.ju-ing.com/posts/nvidia-uninstall/)
lsof /dev/nvidia*

## 정상적으로 종료되었다면 아래 명령어 쳤을 때 아무것도 안떠야 함
sudo rmmod nvidia_drm 
sudo rmmod nvidia_modeset 
sudo rmmod nvidia_uvm 
sudo rmmod nvidia

#  그래픽 드라이버 삭제
 dnf remove *nvidia*

# 그래픽 드라이버 설치(gui 모드에서)
파이어폭스에서 Nvidia 550.107.02로 검색해서 맨 위에 나온 링크에서  /NVIDIA-Linux-x86_64-550.107.02.run 다운로드

# 설치된 그래픽 드라이버에 권한 부여
chmod +x NVIDIA-Linux-x86_64-550.107.02.run

Nvidia 다운 경로로 가서
./NVIDIA-Linux-x86_64-550.107.02.run

- 창 뜨면 continued

- 이 창 뜨면           
  The initramfs will likely need to be rebuilt due to the following condition(s):                     
  * Nouveau is present in the initramfs.                                                              
                                                                                                      
  Would you like to rebuild the initramfs?                                                            
                                                                                                      
                      Do not rebuild initramfs            Rebuild initramfs                           
                                                                                  

Rebuild 선택


- 다음의 창 뜨면
The installer has encountered the following error during installation: 
'Rebuilding initramfs failed'. Would you like to continue installation anyway? 

Continue installation       /         Abort installation 


Continue 선택

하니까 설치됨 


*참고
- (주의) 이 명령어로 쳣다가 560으로 잘못 설치됨
dnf install nvidia-driver nvidia-settings

- 레포 추가(550 버전은 없고 560만 있음…)
dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/rhel8/x86_64/cuda-rhel8.repo



