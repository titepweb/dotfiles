#!/bin/sh
#
# z3bra - (c) wtfpl 2014
# Fetch infos on your computer, and print them to stdout every second.

clock() {
    date '+%Y-%m-%d %H:%M'
}

battery() {
    BATC=/sys/class/power_supply/CMB1/capacity
    BATS=/sys/class/power_supply/CMB1/status

    # prepend percentage with a '+' if charging, '-' otherwise
    test "`cat $BATS`" = "Charging" && echo -n '+' || echo -n '-'

    sed -n p $BATC
}

volume() {
    # we need `uniq` because on some hardware, The master is listed twice in "Front Left" and Front Right" (because laptop speakers I guess)
    amixer get Master | sed -n 's/^.*\[\([0-9]\+\)%.*$/\1/p'| uniq
    amixer get Master | grep 'Mono: Playback' | grep -o '\[on]'
}

cpuload() {
  ps -eo pcpu | awk 'BEGIN {sum=0.0f} {sum+=$1} END {print sum}'

  # another way: require 'bc'
    # LINE=`ps -eo pcpu |grep -vE '^\s*(0.0|%CPU)' |sed -n '1h;$!H;$g;s/\n/ +/gp'`
    # bc <<< $LINE
}

memused() {
  grep -E 'Mem(Total|Free)' /proc/meminfo |awk '{print $2}'

  # another way: require 'bc'
    # read t f <<< `grep -E 'Mem(Total|Free)' /proc/meminfo |awk '{print $2}'`
    # bc <<< "scale=2; 100 - $f / $t * 100" | cut -d. -f1
}

network() {
  # 1- Identify interfaces :
  read lo int1 int2 <<< `ip link | sed -n 's/^[0-9]: \(.*\):.*$/\1/p'`
  if iwconfig $int1 >/dev/null 2>&1; then
      wifi=$int1
      eth0=$int2
  else
      wifi=$int2
      eth0=$int1
  fi
  ip link show $eth0 | grep 'state UP' >/dev/null && int=$eth0 ||int=$wifi

  #int=eth0

  # 2- Connected ?
  ping -c 1 8.8.8.8 >/dev/null 2>&1 && 
      echo "$int connected" || echo "$int disconnected"

  # another way:
    # iw wlp16s0 link | grep 'SSID' | sed 's/SSID: //' | sed 's/\t//'
    # iw wlp16s0 link | grep 'signal' | sed 's/signal: //' | sed 's/ dBm//' | sed 's/\t//'
}

groups() {
    cur=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}'`
    tot=`xprop -root _NET_NUMBER_OF_DESKTOPS | awk '{print $3}'`

    for w in `seq 0 $((cur - 1))`; do line="${line}="; done
    line="${line}|"
    for w in `seq $((cur + 2)) $tot`; do line="${line}="; done
    echo $line
}

nowplaying() {
    cur=`mpc current`
    # this line allow to choose whether the output will scroll or not
    test "$1" = "scroll" && PARSER='skroll -n20 -d0.5 -r' || PARSER='cat'
    test -n "$cur" && $PARSER <<< $cur || echo "- stopped -"
}

# This loop will fill a buffer with our infos, and output it to stdout.
while :; do
    buf=""
    buf="${buf} [$(groups)]   --  "
    buf="${buf} CLK: $(clock) -"
    buf="${buf} NET: $(network) -"
    buf="${buf} CPU: $(cpuload)% -"
    buf="${buf} RAM: $(memused)% -"
    buf="${buf} VOL: $(volume)%"
    buf="${buf} MPD: $(nowplaying)"

    echo $buf
    # use `nowplaying scroll` to get a scrolling output!
    sleep 1 # The HUD will be updated every second
done

exit

echo -e "\n"NUMBER OF MONITORS
bspc query -M | wc -l

lm | lemonbar