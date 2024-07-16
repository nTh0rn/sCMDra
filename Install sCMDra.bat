@echo off
cd %~dp0

::Ensure administrator access
    if "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "test", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit
:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

::Default settings
set install_dir=C:\sCMDra
set acc_command="repo"
set repo_dir=""
	setlocal enableextensions EnableDelayedExpansion
:warning
	cls
	___cecho {09}Simple CMD Repo Access{07}
	echo.
	___cecho {09}Made by Nikolas Thornton ^| nthorn.com{07}
	echo.
	echo.
	___cecho {4F}NOTICE{07}
	echo.
	echo By the end of this installation, you will need to manually add sCMDra's installation 
	echo directory to your system environment Path variable. instructions for this are included
	echo at the end of the installer.
	echo.
	echo Press ENTER if you understand.
	___cecho {00}
	set /p enter=
	___cecho {07}
	cls
	goto main
	

:: Installation Selection Function
::
:: Allows the user to select their form of installation.
:main

	___cecho {09}Simple CMD Repo Access{07}
	echo.
	___cecho {09}Made by Nikolas Thornton ^| nthorn.com{07}
	echo.
	echo.
	echo What type of installation would you like?
	echo.
	___cecho {0F}  1{07} - {0A}Simple Installation{07}
	echo.
	echo       Set the install directory to C:\sCMDra
	echo       Set the access command to "repo"
	echo.
	___cecho {0F}  2{07} - {0C}Custom Installation{07}
	echo.
	echo       Choose the install directory
	echo       Choose the access command
	echo.
	set /p input=?^>

	if "%input%"=="1" (
		goto express
	)
	if "%input%"=="2" (
		goto custom
	)
	
	:: If the previous if statement's were passed, then throw error.
	cls
	call :invalid_param main


:: Express Installation Function
::
:: Directs the user to the default installation.
:express
	cls
	___cecho {09}EXPRESS installation{07}
	echo.
	echo.
	goto :install


:: Custom Installation Function
::
:: Asks the user where they would like to install sCMDra
:: as well as what command they would like to use to
:: access sCMDra.
:custom
	cls
	___cecho {09}CUSTOM installation{07}
	echo.
	echo.
	:retry_install
	echo Please select where to install sCMDra (For example, C:\sCMDra\)
	___cecho {0C}Must contain only "a-z 0-9 -_.,:/\@#$", SPACES PERMITTED.{07}
	echo.
	set folder=NONESELECTED
	call :choose_folder
	call :no_folder_selected :retry_install
	set input=%folder%
	call :check_valid_input :retry_install
	set install_dir=%folder%
	echo You've selected %install_dir%.
	echo.
	:retry_acc
	echo What command would you like to access sCMDra with? (For example, "repo", "sCMDra", "projects")
	___cecho {0C}Must contain only only "a-z 0-9 -_.@#$", NO SPACES PERMITTED.{07}
	echo.
	set /p input=?^>
	call :check_valid_input :retry_acc
	set acc_command=%input%
	echo You've selected "%acc_command%".
	echo.
	goto :install

:: Folder Choosing Function
::
:: Allows the users the select a folder.
:: Output is saved in the variable "folder".
:choose_folder
set "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'Please choose a folder.',0,0).self.path""
for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "folder=%%I"
goto :eof

:: Installation Function
::
:: Asks the user where their repo's folder is and does the
:: actual installation itself.
:install
	echo Please select where your repos are stored. (For example, C:\users\%username%\source\repos)
	set folder=NONESELECTED
	call :choose_folder
	call :no_folder_selected :install
	call :check_valid_input
	set repo_dir=%folder%
	echo You've selected %repo_dir%.
	echo.
	echo Copying to %install_dir% . . .
	if not exist "%install_dir%\" mkdir "%install_dir%\"
	ping 192.0.2.2 -n 1 -w 1000 > nul
	copy "___cecho.exe" "%install_dir%\">nul
	copy "___repo.bat" "%install_dir%\repo.bat">nul
	cd %install_dir%
	echo Initializing install directory . . .

	:: Replaces the filler keywords for the installation directoryand
	:: the repo access command with their actual contents.
	powershell -Command "(gc repo.bat) -replace 'INSTALL_FILLER', '%install_dir%' | Out-File -encoding ASCII repo.bat"
	powershell -Command "(gc repo.bat) -replace 'REPO_FILLER', '%repo_dir%' | Out-File -encoding ASCII repo.bat"

	echo Naming access command . . .
	ren "repo.bat" "%acc_command:"=%.bat"
	cls
	___cecho {C0}                                                                               {07}
	echo.
	___cecho {C0}                          FINAL MANUAL STEP REQUIRED                           {07}
	echo.
	___cecho {C0}                                                                               {07}
	echo.
	echo.
	___cecho {0C}You MUST add the sCMDra install path to your user's environement Path variable.{07}
	echo.
	echo.
	___cecho 1. In the Start Menu, search "Edit the system environment variables" and press Enter.
	echo.
	___cecho 2. Click "Environment Variables ..." in the bottom right of the new window.
	echo.
	___cecho 3. In the upper box labeled "User variables for %username%", select "Path" and click "Edit".
	echo.
	___cecho 4. Click "New" on the right of the new window.
	echo.
	___cecho 5. Type in the path "%install_dir%" or use the "Browse" button to navigate to it.
	echo.
	___cecho 6. Click "Okay" in the bottom right of both windows to save your changes.
	echo.
	echo.
	echo Press ENTER when the steps above have been completed.
	___cecho {00}
	set /p enter=
	___cecho {07}
	___cecho {0A}COMPLETE{07}
	echo.
	echo.
	___cecho Type "{70}%acc_command:"=%{07}" to access sCMDra anywere in Command Prompt.
	echo.
	echo.
	pause>nul
	exit

:: Check For No Folder Function
::
:: Determines if there was no folder selected. Always used
:: in conjunction with :choose_folder
::
:: @param The label to return to if the folder is invalid.
:no_folder_selected
	if "%folder%"=="NONESELECTED" (
		call :invalid_param %1
	) else (
		goto :eof
	)

:: Check For Valid Input Function
::
:: Determines if the given input has any invalid special
:: characters or if it already exists as a command.
::
:: @param The label to return to if the input is invalid.
:check_valid_input
	
	set checkfor=%input%
	
	:: Condition used only if verifying the access command.
	if "%1"==":retry_acc" (
		if NOT "%checkfor: =%"=="%checkfor%" (
			call :invalid_param %1
		)
		
		:: Checks if the input already exists as a command.
		WHERE %checkfor% >NUL 2>&1 || goto :continue
		call :invalid_param %1
	)
	
	:continue
	
	:: Iterate through the input character-by-character
	set strterm=___ENDOFSTRING___
	set tmp=%checkfor%%strterm%
	:loop
		set char=%tmp:~0,1%
		set tmp=%tmp:~1%
		
		:: Ensure the character is one of the valid characters in the list.
		set /a found=0
		for %%a in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z 1 2 3 4 5 6 7 8 9 0 - _ . @ # $ : / \) do (
			
			:: Check if the character is in the list
			if "%%a"=="%char%" (
				set /a found+=1
			)
			
			:: Special cases that can't just be included in the list
			if "%char%"==" " (
				set /a found+=1
			)
			if "%char%"=="," (
				set /a found+=1
			)
			
			:: Conditions used only if verifying the access command.
			if "%1"==":retry_acc" (
				if "%char%"==":" (
					set /a found-=1
				)
				if "%char%"=="," (
					set /a found-=1
				)
			)
		)
		
		echo "%found%" "!found!"
		:: If the current character was not in the list, throw error.
		if %found% LSS 1 (
			call :invalid_param %1
		)
		
		:: Go to next character in input if there are any
		if NOT "%tmp%" == "%strterm%" GOTO loop
		
	@RD /S /Q "___ENDOFSTRING___">NUL 2>&1
	goto :eof
	

:: Throw's an error.
:invalid_param
	@RD /S /Q "___ENDOFSTRING___">NUL 2>&1
	___cecho {4F}Invalid option.{07}
	echo.
	goto %1