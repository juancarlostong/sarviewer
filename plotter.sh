#!/bin/bash
#
# Script        :plotter.sh
# Author        :Julio Sanz
# Website       :www.elarraydejota.com
# Email         :juliojosesb@gmail.com
# Description   :Script to generate graphs in the folder graphs/ of this repository
# Dependencies  :sar,gnuplot
# Usage         :1)Give executable permissions to script -> chmod +x plotter.sh
#                2)Execute script -> ./plotter.sh
# License       :GPLv3
#

# Read sarviewer.properties file
. sarviewer.properties

if [ $# -ne 0 ];then
	echo "This script doesn't accept parameters"
elif [ "$graph_generator" == "gnuplot" ];then
	cd plotters/gnuplot
  if [[ -e ../../data/loadaverage.dat ]]; then
    echo "loadaverage.gplot"
    gnuplot loadaverage.gplot
  fi
  if [[ -e ../../data/loadaverage.dat ]]; then
    echo "tasks.gplot"
    gnuplot tasks.gplot
  fi
  if [[ -e ../../data/cpu.dat ]]; then
    echo "cpu.gplot"
	  gnuplot cpu.gplot
  fi
  if [[ -e ../../data/ram.dat ]]; then
    echo "ram.gplot"
	  gnuplot ram.gplot
  fi
  if [[ -e ../../data/swap.dat ]]; then
    echo "swap.gplot"
	  gnuplot swap.gplot
  fi
  if [[ -e ../../data/iotransfer.dat ]]; then
    echo "iotransfer.gplot"
	  gnuplot iotransfer.gplot
  fi
  if [[ -e ../../data/proc.dat ]]; then
    echo "proc.gplot"
	  gnuplot proc.gplot
    echo "contextsw.gplot"
	  gnuplot contextsw.gplot
  fi
	if [[ -e ../../data/netinterface.dat ]]; then
    echo "netinterface.gplot"
    gnuplot netinterface.gplot
  fi
  if [[ -e ../../data/sockets.dat ]]; then
    echo "sockets.gplot"
	  gnuplot sockets.gplot
  fi
elif [ "$graph_generator" == "matplotlib" ];then
	cd plotters/matplotlib
	python loadaverage.py
	python tasks.py
	python cpu.py
	python ram.py
	python swap.py
	python iotransfer.py
	python proc.py
	python contextsw.py
	python netinterface.py
	python sockets.py
else
	echo "Variable graph_generator must be \"gnuplot\" or \"matplotlib\", please check sarviewer.properties"
fi
