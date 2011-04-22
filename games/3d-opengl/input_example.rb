# Based on tutorial: http://lwjgl.org/wiki/index.php?title=LWJGL_Basics_2_(Input)

require "java"
require "lwjgl/jar/lwjgl.jar"

include_class "org.lwjgl.opengl.Display"
include_class "org.lwjgl.opengl.DisplayMode"
include_class "org.lwjgl.input.Keyboard"
include_class "org.lwjgl.input.Mouse"
include_class "org.lwjgl.LWJGLException"

class InputExample
  def start
    begin
      Display.display_mode = DisplayMode.new(800, 600)
      Display.create
    rescue LWJGLException => e
      e.print_stack_trace
      exit 0
    end
    
    until Display.close_requested?
      poll_input
      Display.update
    end
    
    Display.destroy
  end
  
  def poll_input
    if Mouse.button_down?(0)
      # For some reason these won't work with ruby-style method calls
      x = Mouse.getX
      y = Mouse.getY
      puts "Mouse down @ X: #{x} Y: #{y}"
    end
    
    puts "Space key is down." if Keyboard.key_down?(Keyboard::KEY_SPACE)
    
    while Keyboard.next # loop through the event buffer
      if Keyboard.event_key_state # true on key down, false on key up
        puts "A key pressed." if Keyboard.event_key == Keyboard::KEY_A
        puts "S key pressed." if Keyboard.event_key == Keyboard::KEY_S
        puts "D key pressed." if Keyboard.event_key == Keyboard::KEY_D
      else
        puts "A key released." if Keyboard.event_key == Keyboard::KEY_A
        puts "S key released." if Keyboard.event_key == Keyboard::KEY_S
        puts "D key released." if Keyboard.event_key == Keyboard::KEY_D
      end
    end
  end
end

input_example = InputExample.new
input_example.start
