To run a script you have to tell lwjgl where the natives are for your os:

    jruby -J-Djava.library.path=lwjgl/native/macosx display_example.rb

or (on OS X) use the run.sh script:

    ./run.sh display_example.rb