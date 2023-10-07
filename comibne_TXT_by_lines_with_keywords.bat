@echo off
setlocal enabledelayedexpansion

set /a count = 0
set "outputFile=output.txt"
set "keywords=SL SC"

del "%outputFile%"

for %%F in (*.txt) do (
    echo Processing file: %%F
	set "filename=%%~nF"
	(echo ========== START of File Name: !filename!) >> "%outputFile%"
    for %%K in (%keywords%) do (
        findstr /C:"%%K" "%%F" >> "%outputFile%"
    )
	echo. >> "%outputFile%"
	(echo ============================== END of File Name: !filename!) >> "%outputFile%"
	echo. >> "%outputFile%"
	set /a count += 1
)

echo. >> "%outputFile%"
echo. >> "%outputFile%"
echo ~~~~~~~~~~~~~~~~~~~~~~~~OPERATION ENDED SUCCESFULLY ~~~~~~~~~~~~~~~~~~~~~~~~>> "%outputFile%"
echo WARNING: lines containing multiple keywords are duplicated >> "%outputFile%"
echo Processed files: !count! >> "%outputFile%"
echo Used keywords: !keywords! >> "%outputFile%"
echo Processed directory %cd% >> "%outputFile%"

echo Lines containing keywords have been saved to "%outputFile%"

endlocal