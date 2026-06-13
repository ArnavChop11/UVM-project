@echo off
setlocal

call C:\AMDDesignTools\2025.2.1\Vivado\settings64.bat

echo.
echo Cleaning previous XSim outputs...
if exist xsim.dir rmdir /s /q xsim.dir
if exist xvlog.log del xvlog.log
if exist xelab.log del xelab.log
if exist xsim.log del xsim.log
if exist webtalk*.log del webtalk*.log
if exist tb_sim.wdb del tb_sim.wdb

echo.
echo Compiling...
call xvlog -sv -L uvm -f files.f
if errorlevel 1 (
    echo Compile failed.
    exit /b %errorlevel%
)

echo.
echo Elaborating...
call xelab -L uvm tb_top -s tb_sim -debug typical
if errorlevel 1 (
    echo Elaboration failed.
    exit /b %errorlevel%
)

@REM UNCOMMENT -wdb tb_sim.wdb TO CREATE WAVEFORM
echo.
echo Running simulation and creating waveform database...
call xsim tb_sim ^
    -testplusarg UVM_TESTNAME=%TESTNAME% ^
    -testplusarg UVM_NO_RELNOTES ^
    @REM -wdb tb_sim.wdb ^
    -tclbatch run.tcl

if errorlevel 1 (
    echo Simulation failed.
    exit /b %errorlevel%
)

echo.
echo Simulation completed successfully.
endlocal