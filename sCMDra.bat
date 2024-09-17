@echo off
title Repo Selection
setlocal EnableDelayedExpansion
@chcp 65001>nul
set original_dir="%CD%"
:go_to_top
set /a numofdirs=0
set /a i=0
echo >> "INSTALL_TEMP\dirs.txt"
set "dirs=INSTALL_TEMP\dirs.txt"
set /a count=0
cd "REPO_TEMP"
del "INSTALL_TEMP\dirs.txt">nul

::Load current directory's into dirs.txt
dir /b /o:-d >> "INSTALL_TEMP\dirs.txt"

::Read dirs.txt
for /F "tokens=* delims=" %%a in ('Type "%dirs%"') do (
	Set /a count+=1
	Set "output[!count!]=%%a"
)
echo.
For /L %%i in (1,1,%Count%) Do (
	Call :search "!output[%%i]!"
)
set /a helpnum=!numofdirs!+1
"INSTALL_TEMP\___cecho" {0F}  {\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}
echo.
"INSTALL_TEMP\___cecho" {0F}  !helpnum!{07} - Additional Options

set /a reponum=!helpnum!+1
echo.
"INSTALL_TEMP\___cecho" {0F}  !reponum!{07} - Exit to REPO_TEMP

set /a exitnum=!reponum!+1
echo.
"INSTALL_TEMP\___cecho" {0F}  !exitnum!{07} - Exit to !original_dir:"=!
echo.

cd ..
goto select_repo

:uninstall
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
	>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
	) ELSE (
	>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
	)

	REM --> If error flag set, we do not have admin.
	if '%errorlevel%' NEQ '0' (
		echo.
		"INSTALL_TEMP\___cecho" {0C}Administrator access is required to uninstall.{07}
		echo.
		"INSTALL_TEMP\___cecho" {0C}Press ENTER to relaunch sCMDra as Administrator.{07}
		echo.
		pause>nul
		goto UACPrompt
	) else ( goto gotAdmin )

	:UACPrompt
		echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
		set params= %*
		echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "test", "runas", 1 >> "%temp%\getadmin.vbs"

		"%temp%\getadmin.vbs"
		del "%temp%\getadmin.vbs"
		echo.
		"INSTALL_TEMP\___cecho" {4F}Exiting to %original_dir%{07}
		echo.
		"INSTALL_TEMP\___cecho" {0C}Navigate to Uninstall in new Administrator window.{07}
		echo.
		exit /B

	:gotAdmin
		pushd "%CD%"
		CD /D "%~dp0"

	echo.
	___cecho {C0}                                                                       {07}
	echo.
	___cecho {C0}             MANUAL STEP REQUIRED FOR 100%% UNINSTALLATION              {07}
	echo.
	___cecho {C0}                                                                       {07}
	echo.
	echo.
	___cecho {0C}Delete the sCMDra path from your user's environment Path variable{07}
	echo.
	echo.
	echo 1. In the Start Menu, search "Edit the system environment variables" and press Enter
	echo 2. Click "Environment Variables ..." in the bottom right of the new window
	echo 3. In the upper box labeled "User variables for %username%", select "Path" and click "Edit"
	echo 4. Select the path "INSTALL_TEMP" and click "Delete"
	echo 5. Click "Okay" in the bottom right of both windows to save your changes.
	echo.
	___cecho {09}This step is optional and the file contents and functionality of sCMDra will be deleted regardless.{07}
	echo.
	echo.
	echo Press ENTER to continue uninstallation regardless of whether you've deleted the environment Path variable.
	___cecho {00}
	set /p enter=
	___cecho {07}
	cd %original_dir%>NUL 2>&1
	start /b "" cmd /c del "%~f0">NUL 2>&1&RD /S /Q "INSTALL_TEMP">NUL 2>&1&echo Uninstallation Complete.&echo Press ENTER to exit.&pause>nul&exit /b>NUL 2>&1
	exit /b

:: Search the repos directory for git folders
:search
	set fold=%1
	if NOT exist "REPO_TEMP\%fold:"=%\" (
		goto :eof
	)
	cd "REPO_TEMP\%fold:"=%"
	set fold=!fold:"=!
	
	:: Ensure the folder is a git repository. If you'd like to
	:: modify sCMDra to list all folders, simply remove the if
	:: statement surrounding the code below.
	if EXIST "REPO_TEMP\%fold:"=%\.git" (
		set /a numofdirs+=1
		"INSTALL_TEMP\___cecho" {0F}  !numofdirs!{07} - %fold:"=%
		echo.
		set jump_to_repo_!numofdirs!="REPO_TEMP\%fold:"=%"
	)
	goto :eof

:: Select which repo to open
:select_repo
if exist "!dirs!" (
	del "INSTALL_TEMP\dirs.txt">NUL 2>&1
)
echo.
set /p input=?^> 

if /I "!input!"=="!exitnum!" (
	echo.
	"INSTALL_TEMP\___cecho" {4F}Exiting to %original_dir:"=%{07}
	echo.
	goto :eof
)

if /I "!input!"=="!reponum!" (
	echo.
	"INSTALL_TEMP\___cecho" {4F}Exiting to REPO_TEMP{07}
	echo.
	endlocal
	cd "REPO_TEMP"
	goto :eof
)

if /I "!input!"=="!helpnum!" (
	:help_menu
	"INSTALL_TEMP\___cecho" {07}  {\u250C}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u252C}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2510}{07}
	echo.
	"INSTALL_TEMP\___cecho" {07}  {\u2502} Additional Options {\u2502} {09}sCMDra{07} {\u2502}{07}
	echo.
	"INSTALL_TEMP\___cecho" {07}  {\u2514}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2534}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2500}{\u2518}{07}
	echo.
	echo.
	"INSTALL_TEMP\___cecho" {0F}  1{07} - {0C}Uninstall sCMDra{07}
	echo.
	"INSTALL_TEMP\___cecho" {0F}  2{07} - Return to the previous menu
	echo.
	echo.
	set /p input=?^>
	if "!input!"=="1" (
		:uninstall_menu
		echo.
		"INSTALL_TEMP\___cecho" {4F}Are you sure you'd like to uninstall sCMDra? ^(Y/N^){07}
		echo.
		set /p input=?^>
		
		if "!input!"=="Y" (
			goto uninstall
		)
		if "!input!"=="N" (
			goto help_menu
		)
		"INSTALL_TEMP\___cecho" {4F}Invalid option.{07}
		echo.
		goto uninstall_menu
		
	)
	if "!input!"=="2" (
		goto go_to_top
	)
	"INSTALL_TEMP\___cecho" {4F}Invalid option.{07}
	echo.
	goto help_menu
)

set usableinput="jump_to_repo_!input:"=!"
set usableinput="!%usableinput:"=%!"

if "%usableinput:"=%"=="" (
	echo.
	"INSTALL_TEMP\___cecho" {4F}Invalid option.{07}
	echo.
	goto select_repo
)
echo %usableinput% >> "INSTALL_TEMP\dirs.txt"
echo %usableinput% > "INSTALL_TEMP\dirs.txt"
endlocal
set /p usableinput=<"INSTALL_TEMP\dirs.txt"
del "INSTALL_TEMP\dirs.txt"
@RD /S /Q "INSTALL_TEMP\___ENDOFSTRING___">NUL 2>&1
title Command Prompt
cd "%usableinput:"=%"
if NOT "%usableinput:"=%"=="" (
	start "" "%CD:"=%"
)