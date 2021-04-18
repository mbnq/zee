:: Written by mbnq.pl 2020
::
@echo off
title Mbnq ZipEveryExE
color 17
setlocal enableextensions enabledelayedexpansion
cls

:: for every file call function zee for file %_file%
for %%i in ("*.exe") do (set _file=%%i) & call :zee
goto DONE

:: main function
:zee

	echo:Working with %_file%
	
	:: removing space symbols from filename
	ren "%_file%" "%_file: =%" && set _file=%_file: =%
	
	:: compress file and remove last 4 symbols from it, e.g. file.exe makes file.zip
	powershell Compress-Archive -Path %_file% -CompressionLevel Fastest -DestinationPath %_file:~0,-4%.zip -Force
	
	if exist "%_file:~0,-4%.zip" (DEL %_file% /F /Q && echo:%_file:~0,-4%.zip ready!) else (echo:Something went wrong...)

goto :eof

:DONE
echo:Done.
pause > nul
