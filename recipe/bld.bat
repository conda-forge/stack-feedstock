
mkdir "%PREFIX%\bin" || goto :error
move stack.exe "%PREFIX%\bin\stack.exe" || goto :error
goto :EOF

:error
echo Failed with error #%errorlevel%.
dir /s
exit 1
