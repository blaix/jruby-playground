# Based on tutorial from http://lwjgl.org/wiki/index.php?title=LWJGL_Basics_1_(The_Display)

require "java"
require "lwjgl/jar/lwjgl.jar"

include_class "org.lwjgl.LWJGLException"
include_class "org.lwjgl.opengl.Display"
include_class "org.lwjgl.opengl.DisplayMode"

class DisplayExample
  def start
    Display.display_mode = DisplayMode.new(800, 600)
    Display.create
    Display.update until Display.close_requested?
    Display.destroy
  rescue LWJGLException => e
    e.print_stack_trace
    exit 0
  end
end

display_example = DisplayExample.new
display_example.start
