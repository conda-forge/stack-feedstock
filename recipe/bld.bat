
mkdir "%PREFIX%\bin" || goto :error
mv stack "%LIBRARY_BIN%\stack" || goto :error
goto :EOF

:error
echo Failed with error #%errorlevel%.
dir /s
exit 1
