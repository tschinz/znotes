---
tags:
- os
- operating system
- windows
- commandline
---
# Commandline

Sample scripts can be found in the [config repo]({{config_repo_folder}}/scripts/bat)

## Get Win License Key

``` bat
wmic path softwarelicensingservice get OA3xOriginalProductKey
```

## Hyper-V

``` bat
:: enable
bcdedit /set hypervisorlaunchtype auto

:: disable
bcdedit /set hypervisorlaunchtype off
```

## `Bat` Script

### Start - End Script

``` bat title="skeleton.bat"
:start
  @echo off
  setlocal
  set cmd_location="%~dp0"
  pushd %cmd_location%
  set SEPARATOR="--------------------------------------------------------------------------------"
  set INDENT="  "

  echo %SEPARATOR%
  echo "-- %~nx0 Started!"
  echo.

:script

:end
  echo.
  echo "-- %~nx0 Finished!"
  echo %SEPARATOR%
  popd
  endlocal
  goto:eof
```

### Run other script

``` bat title="delete.bat"
:: Runs scripts and comes back
call "./script.bat"
```

### Delete

``` bat title="delete.bat"
set base_directory="%cmd_location:"=%.."

echo "Delete files in: %base_directory%"
del /f /s /a %base_directory%\*cache.dat

echo "Delete intermediate directories in: %base_directory%"
for /d /r "%base_directory:"=%" %%a in (.xrf\) do if exist "%%a" rmdir /s /q "%%a"
```

### Directory

``` bat title="dir.bat"
echo Delete directory %dir%
if exist %dir% (
  echo    %dir% found
) else (
  echo    %dir% not found!
)

echo Create %dir%  if not exist
if not exist "%dir%" (
  mkdir "%dir:"=%"
)
```

### Remove trailing `\`

``` bat title="string_manipulation.bat"
if %cmd_location:~-1%==\ set design_directory=%design_directory:~0,-1%
```

### Commandline Arguments

``` bat title="cmnd_args.bat"
::------------------------------------------------------------------------------
:: Parse command line options
::
:parse
set usage1="Usage: hdl_designer.bat [-v] [-h]"
set usage2="                        [-n designName]"
set usage3="                        [-d designDirectory]"

echo "Search Commandline Parameters"
:parseloop
if not "%1"=="" (
    if "%1"=="-v" (
        set VERBOSE=1
        echo "%INDENT:"=%verbose enabled"
        shift
    )
    if "%1"=="-h" (
        goto :HELP
        shift
    )
    if "%1"=="-n" (
        set design_name=%2
        echo "%INDENT:"=%design_name=!design_name:"=! "
        shift & shift
    )
    if "%1"=="-d" (
        set design_directory=%2
        echo "%INDENT:"=%design_directory=!design_directory:"=! "
        shift & shift
    )
    goto :parseloop
)
echo.

::------------------------------------------------------------------------------
:: Helper Functions
::
:HELP
  echo.
  echo %usage1:"=%
  echo %usage2:"=%
  echo %usage3:"=%
  echo.&pause&goto:eof
```

### Forcing ownership

German Version

``` bat title="force_ownership_de.bat"
SET DIRECTORY_NAME="C:\Folder\You\Want\Rights\To"
TAKEOWN /f %DIRECTORY_NAME% /r /d J
ICACLS %DIRECTORY_NAME% /grant administratoren:F /t
pause
```

English Version

``` bat title="force_ownership_en.bat"
SET DIRECTORY_NAME="C:\Folder\You\Want\Rights\To"
TAKEOWN /f %DIRECTORY_NAME% /r /d Y
ICACLS %DIRECTORY_NAME% /grant administrators:F /t
pause
```

General

``` bat title="force_ownership.bat"
pushd .
takeown /f * /r /a
icacls *.* /grant:r everyone:f /t /c /q
popd
```