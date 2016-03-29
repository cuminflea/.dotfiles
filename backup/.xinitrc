export LC_CTYPE="zh_CN.UTF-8"
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

#auto start
compton -b

xset -b

exec startxfce4
#sxhkd &
#xterm &
#exec bspwm
