echo on
stack --help
stack new helloworld new-template
cd helloworld
set STACK_OPTS=" --resolver lts-8.24 "
stack %STACK_OPTS% setup
stack %STACK_OPTS% build
stack %STACK_OPTS% exec helloworld-exe
