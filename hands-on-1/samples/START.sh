#!/bin/sh

export LC_NUMERIC="en_US.UTF-8"

set -euo pipefail

clear 

###################################
# FUNCTIONS                       #
###################################

showPropeller() {
   
   tput civis
   
   while [ -d /proc/$! ]
   do
      for i in / - \\ \|
      do
         printf "\033[1D$i"
         sleep .1
      done
   done
   
   tput cnorm
}


create_plot_script_time() {
cat <<EOF >time.plt
set title "Execution Time" 
set ylabel "Time (Seconds)"
set xlabel "Size"

set style line 1 lt 2 lc rgb "cyan"   lw 2 
set style line 2 lt 2 lc rgb "red"    lw 2
set style line 3 lt 2 lc rgb "gold"   lw 2
set style line 4 lt 2 lc rgb "green"  lw 2
set style line 5 lt 2 lc rgb "blue"   lw 2
set style line 6 lt 2 lc rgb "black"  lw 2
set style line 7 lt 2 lc rgb "orange"  lw 2
set style line 8 lt 2 lc rgb "gray"  lw 2

set terminal postscript eps enhanced color
set output 'time.eps'

set xtics nomirror
set ytics nomirror
set key top left
set key box
set style data lines


plot "file_comparison.data" using 1:2 title "Sequential"              ls 1 with linespoints,\
     "file_comparison.data" using 1:3 title "T=2"                     ls 2 with linespoints,\
     "file_comparison.data" using 1:4 title "T=3"                     ls 3 with linespoints,\
     "file_comparison.data" using 1:5 title "T=4"                     ls 4 with linespoints,\
     "file_comparison.data" using 1:6 title "T=5"                     ls 5 with linespoints,\
     "file_comparison.data" using 1:7 title "T=6"                     ls 6 with linespoints,\
     "file_comparison.data" using 1:8 title "T=7"                     ls 7 with linespoints,\
     "file_comparison.data" using 1:9 title "T=8"                     ls 8 with linespoints
EOF
}

create_plot_script_speedup() {
cat <<EOF >speedup.plt
set title "Speedup" 
set ylabel "Speedup"
set xlabel "Size"

set style line 1 lt 2 lc rgb "cyan"   lw 2 
set style line 2 lt 2 lc rgb "red"    lw 2
set style line 3 lt 2 lc rgb "gold"   lw 2
set style line 4 lt 2 lc rgb "green"  lw 2
set style line 5 lt 2 lc rgb "blue"   lw 2
set style line 6 lt 2 lc rgb "black"  lw 2
set style line 7 lt 2 lc rgb "orange"  lw 2
set style line 8 lt 2 lc rgb "gray"  lw 2

set terminal postscript eps enhanced color
set output 'speedup.eps'

set xtics nomirror
set ytics nomirror
set key top left
set key box
set style data lines

plot "file_speedup.data" using 1:2 title "T=2"    ls 1 with linespoints,\
     "file_speedup.data" using 1:3 title "T=3"    ls 2 with linespoints,\
     "file_speedup.data" using 1:4 title "T=4"    ls 3 with linespoints,\
     "file_speedup.data" using 1:5 title "T=5"    ls 4 with linespoints,\
     "file_speedup.data" using 1:6 title "T=6"    ls 5 with linespoints,\
     "file_speedup.data" using 1:7 title "T=7"    ls 6 with linespoints,\
     "file_speedup.data" using 1:8 title "T=8"    ls 7 with linespoints
EOF
}

################################################
# 0. COMPILATION + PERMISSIONS  TO EXECUTE     #
################################################

gcc mm.c -o mm -fopenmp -O3
chmod +x mm

###################################
# Experimental Times              #
###################################

sleep 5 > /dev/null 2>&1 &

printf "Loading...\040\040" ; #showPropeller
echo " "

for i in 100 200 300 400 500 600 700 800 900 1000
do
printf "\033[1D$i :" 
OMP_NUM_THREADS=1   ./mm               "$i"    >> file1
OMP_NUM_THREADS=2   ./mm               "$i"    >> file2
OMP_NUM_THREADS=3   ./mm               "$i"    >> file3
OMP_NUM_THREADS=4   ./mm               "$i"    >> file4
OMP_NUM_THREADS=5   ./mm               "$i"    >> file5
OMP_NUM_THREADS=6   ./mm               "$i"    >> file6
OMP_NUM_THREADS=7   ./mm               "$i"    >> file7
OMP_NUM_THREADS=8   ./mm               "$i"    >> file8
done

clear 

echo " "
echo " "
echo "    ********************************"
echo "    * Experimental Time Comparison *"
echo "    ********************************"
echo " "

pr -m -t -s\  file1 file2 file3 file4 file5 file6 file7 file8  | awk '{print $1,"\t",$2,"\t",$4,"\t",$6,"\t",$8,"\t",$10,"\t",$12,"\t",$14,"\t",$16}' >> file_comparison.data

echo " "
echo "    [#][size]    [ST02]	          [ST03]	  [ST04]         [ST05]           [ST06]          [ST07]         [ST08]"
cat -n  file_comparison.data

sleep 3

#####################
# SPEEDUP           #
#####################

awk '{print $1, " ",(($2*1000)/($3*1000))}' file_comparison.data >> fspeed0 #OMP T=02 
awk '{print $1, " ",(($2*1000)/($4*1000))}' file_comparison.data >> fspeed1 #OMP T=03
awk '{print $1, " ",(($2*1000)/($5*1000))}' file_comparison.data >> fspeed2 #OMP T=04
awk '{print $1, " ",(($2*1000)/($6*1000))}' file_comparison.data >> fspeed3 #OMP T=05
awk '{print $1, " ",(($2*1000)/($7*1000))}' file_comparison.data >> fspeed4 #OMP T=06
awk '{print $1, " ",(($2*1000)/($8*1000))}' file_comparison.data >> fspeed5 #OMP T=07
awk '{print $1, " ",(($2*1000)/($9*1000))}' file_comparison.data >> fspeed6 #OMP T=08


pr -m -t -s\  fspeed0 fspeed1 fspeed2 fspeed3 fspeed4 fspeed5 fspeed6 | awk '{print $1,"\t",$2,"\t",$4,"\t",$6,"\t",$8,"\t",$10,"\t",$12,"\t",$14,"\t",$16}' >> file_speedup.data

echo " "
echo " "
echo "    ********************************"
echo "    * Speedup  Rate                *"  
echo "    ********************************"
echo " "
echo "    [#][size]    [ST02]	          [ST03]	  [ST04]         [ST05]           [ST06]        [ST07]      [ST08] "
cat -n file_speedup.data

sleep 3

#####################
# PLOTING           #
#####################
echo " "
#echo "Do you want to plot a graphic (y/n)?"
#read resp

#if [[ $resp = "y" ]];then
         echo "ploting eps graphic with gnuplot..."
         create_plot_script_time
         create_plot_script_speedup
         gnuplot "time.plt"
         gnuplot "speedup.plt"
#rename the files
  mv time.eps  time.$(whoami)@$(hostname)-$(date +%F%T).eps
  mv speedup.eps  speedup.$(whoami)@$(hostname)-$(date +%F%T).eps
#fi

sleep 1

echo " "
echo "[Remove unnecessary files] "
rm -f *.txt file* fspeed* *.data mm *.plt
echo " "

sleep 7 > /dev/null 2>&1 &

printf "Loading...\040\040" ; #showPropeller
echo " "
echo "[END] " 
echo " "

