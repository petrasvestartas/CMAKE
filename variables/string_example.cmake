#message
message("Hello World!")

#create and set variables
set(FOO "Foo Value")

#get values
message("${FOO}")

#Variable concatenation 
#Example using "." symbol, by default concatenation is made using ";"
set(MY_PROJECT_MAJOR "1")
set(MY_PROJECT_MINOR "2")
set(MY_PROJECT_PATCH "3")
set(MY_PROJECT_VERSION  ${MY_PROJECT_MAJOR} ${MY_PROJECT_MINOR} ${MY_PROJECT_PATCH} )
message("${MY_PROJECT_VERSION}")
set(MY_PROJECT_VERSION "${MY_PROJECT_MAJOR}.${MY_PROJECT_MINOR}.${MY_PROJECT_PATCH}")
message("${MY_PROJECT_VERSION}")

#Manipulation of strings
set(PLATFORM "WINDOWS")
set(HELLO_MESSAGE_WINDOWS "Hello W-I-N-D-O-W-S OS")
set(HELLO_MESSAGE_UNIX "Hello U-N-I-X OS")
message("HELLO_MESSAGE_${PLATFORM} = ${HELLO_MESSAGE_${PLATFORM}}")

#Multi-line format using "[[" and "]]"
set(HELLO_MESSAGE [[
echo "Hello
World!
]])
message("${HELLO_MESSAGE}")