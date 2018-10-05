#!/bin/sh
# Dylan's Lemonbar Clock
# Very heavily modified by APIUM

battery () {
    battery="$(</sys/class/power_supply/BAT0/capacity)"
    charging="$(</sys/class/power_supply/BAT0/status)"

    case "$battery" in
        [0-9]|10)
            battery="${battery}%  \uf244"
        ;;

        1[0-9]|2[0-5])
            battery="${battery}%  \uf243"
        ;;

        2[6-9]|3[0-9]|4[0-9]|50)
            battery="${battery}%  \uf242"
        ;;

        5[1-9]|6[0-9]|7[0-5])
            battery="${battery}%  \uf241"
        ;;

        7[6-9]|8[0-9]|9[0-9])
            battery="${battery}%  \uf240"
        ;;
		10[0-9]|11[0-9]|12[0-9])
			battery="Charged"
		;;
    esac

	if [ $battery != "Charged" ]
   		then
    		[ "$charging" == "Charging" ] && \
        	battery="Charging  $battery"
		else
			$battery="Charged"
			$batt100 = true
	fi

    printf "%s: %s" "$charging" "$battery"
}

batttime(){
    calc(){ printf "%.2f\n" `echo $@ |bc -l`;}
    charge(){ cat /sys/class/power_supply/BAT0/charge_now;}
    current(){ cat /sys/class/power_supply/BAT0/current_now;}
    full(){ cat /sys/class/power_supply/BAT0/charge_full;}
    charging="$(</sys/class/power_supply/BAT0/status)"

    # echo $(current) / $(charge) | bc -l
    if [ "$charging" == "Charging" ]
        then
            calc "($(full) - $(charge)) / $(current)"
        else
            calc $(charge) / $(current)
    fi 
}

# aim is to read the time over a 10s period, then average it out over that 
# period and only then output the time remaining.
# I have no idea how to do this so this will remain a copy of above until
# I can use bash...
battime-ave(){
	iBatt =$(batttime)
	# maybne make a thread to do the calc, pass the message through
	# when the script loads use the instantanous abtt for first 10s
}

wifi(){
    ping -c 1 8.8.8.8 >/dev/null 2>&1 && echo "   Connected" || echo "   Disconnected"    
}

sound(){

    amixer get Master | sed -n 's/^.*\[\([0-9]\+\)%.*$/\1/p'| uniq

}

soundMute() {
	amixer sget Master | tail -1 | grep off >/dev/null; return $?
}

soundOut() {
	if soundMute; then
		echo $(sound)" [M]"
   	else
		echo $(sound)
   	fi
}

wifiSpec() {
	line=$(connmanctl state | head -1 | cut -f 5 -d " ")
	out=Error
	ssid=$(iwgetid | cut -d "\"" -f 2)

	case $line in
		idle)
			out=Disconnected
			;;
		online)
			out="Connected"
			;;
		ready)
			out="Connected [R]"
			;;
	esac

	echo $out
}

while :; do
	echo -e "%{l}    $(wifiSpec) $(wifiSSID)    |    Volume: $(soundOut) %{c}$(date "+%a %d %b %l:%M %p")%{r}$(battery)     |     $(batttime) Hours     %{r}"

# try to get it to hide of mpv fullscreen
    if [ -z "$WINDOWID" ] ; then
    WINDOWID=$(xdotool search --name bar)
    if [ ! -z "$WINDOWID" ] ; then
        xprop -id $WINDOWID -f _NET_WM_STATE 32a -set _NET_WM_STATE _NET_WM_STATE_STICKY,_NET_WM_STATE_BELOW
        xprop -id $WINDOWID -f _NET_WM_WINDOW_TYPE 32a -set _NET_WM_WINDOW_TYPE _NET_WM_WINDOW_TYPE_NORMAL
        fi
    fi
    sleep 1s
done |

lemonbar -d -b -g "1200x75+1000+20" -f "Roboto-8" -o 0 -f "fontawesome-8" -o 0 -B "#FCFCFC" -F "#2E2E2E" & lemonbar -g 2800x90 -B{#AAFFFFFF} -b
