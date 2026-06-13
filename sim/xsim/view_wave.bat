@echo off
setlocal

call C:\AMDDesignTools\2025.2.1\Vivado\settings64.bat

if not exist tb_sim.wdb (
    echo No tb_sim.wdb found. Run run_xsim.bat first.
    exit /b 1
)

call xsim tb_sim.wdb -gui

endlocal