@echo off
set xv_path=C:\\Xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto 44cc7ca2d36b449db619ddb1809684f4 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_lookuptable_behav xil_defaultlib.tb_lookuptable -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
