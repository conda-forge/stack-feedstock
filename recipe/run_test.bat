
stack --version                   || goto :error

stack --help                      || goto :error

stack new helloworld new-template || goto :error

cd helloworld                     || goto :error

stack -v setup                    || goto :error

stack build                       || goto :error

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
