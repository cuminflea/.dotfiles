export LC_CTYPE="zh_CN.UTF-8"
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"


#auto start
compton -b
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
xset -b

exec startxfce4
#sxhkd &
#xterm &
#exec bspwm
