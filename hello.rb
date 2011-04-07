require "java"

# Be sure to compile the class first with:
#   javac Hello.java
include_class "Hello"

hello = Hello.new
hello.say_hello("ruby")
