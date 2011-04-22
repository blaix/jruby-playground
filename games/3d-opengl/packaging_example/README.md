# JRuby + LWJGL packaging example with rawr

This is an example of using [rawr](http://rawr.rubyforge.org/) to package a
JRuby game that uses the LWJGL library.

See src/main.rb for the guts of the bare bones "game" example.

## Instructions

Edit the rawr config file and set TARGET_PLATFORM to 'windows' or 'macosx'
(compiling for Linux is possible but I didn't get that far):

    # In build_configuration.rb
    TARGET_PLATFORM = 'macosx'
    
Then run:

    rake rawr:bundle:app # for macosx
    
or...

    rake rawr:bundle:exe # for windows

Then you can open:

    package/osx/package_example.app # on macosx
    
or...

    package/windows/package_example.exe # on windows
    
Then you can move the box around with the arrow keys! Hit ESC to quit.
