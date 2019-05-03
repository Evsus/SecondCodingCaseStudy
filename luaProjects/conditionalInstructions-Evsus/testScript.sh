if [ -e $@ ]; then
file=$@
#alias for test file
unitTest="test$file"
#start typescript to record executed luacheck and unit tester
script --quiet --append --command "luacheck $file; 
#line feed declaring lint is done
printf '\ntest complete\n--------------------------------\n\n';
#Unit tester 
lua $unitTest --verbose --output TAP" testResults.txt exit
else printf "file doesn't exist!\n"
fi