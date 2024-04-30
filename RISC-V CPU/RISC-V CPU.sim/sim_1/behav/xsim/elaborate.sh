#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2019.1 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Tue Apr 30 19:53:56 EDT 2024
# SW Build 2552052 on Fri May 24 14:47:09 MDT 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xelab -wto 01f04f27e61c46c3aa9b0f4308d60c05 --incr --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot Control_tb_behav xil_defaultlib.Control_tb xil_defaultlib.glbl -log elaborate.log"
xelab -wto 01f04f27e61c46c3aa9b0f4308d60c05 --incr --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot Control_tb_behav xil_defaultlib.Control_tb xil_defaultlib.glbl -log elaborate.log
