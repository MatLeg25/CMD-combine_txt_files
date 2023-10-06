@echo off
setlocal enabledelayedexpansion

set "outputFile=output.txt"

del "%outputFile%"

for %%F in (*.txt) do (
    echo Processing file: %%F
    (echo ========== START of File Name: %%F) >> "%outputFile%"
    type "%%F" >> "%outputFile%"
	echo. >> "%outputFile%"
    (echo =============== END of File: %%F) >> "%outputFile%"
    echo. >> "%outputFile%"
)

echo Files have been combined and saved to "%outputFile%"

endlocal
