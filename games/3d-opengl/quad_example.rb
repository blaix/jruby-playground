# Adapted from http://lwjgl.org/wiki/index.php?title=LWJGL_Basics_3_(The_Quad)

require "java"
require "lwjgl/jar/lwjgl.jar"

include_class "org.lwjgl.LWJGLException"
include_class "org.lwjgl.opengl.Display"
include_class "org.lwjgl.opengl.DisplayMode"
include_class "org.lwjgl.opengl.GL11"

class QuadExample
  def start
    begin
      Display.display_mode = DisplayMode.new(800, 600)
      Display.create
    rescue LWJGLException => e
      e.print_stack_trace
      exit 0
    end
    
    # Initialize a 2D view (clipping between 1 and -1) with opengl
    # TODO: I still need to wrap my head around this stuff...
    GL11.gl_matrix_mode(GL11::GL_PROJECTION)
    GL11.gl_load_identity
    GL11.gl_ortho(0, 800, 600, 0, 1, -1)
    GL11.gl_matrix_mode(GL11::GL_MODELVIEW)
    
    until Display.close_requested?
      # Clear the screen and depth buffer
      GL11.gl_clear(GL11::GL_COLOR_BUFFER_BIT | GL11::GL_DEPTH_BUFFER_BIT)

      # set the color of the quad (R,G,B,A)
      GL11.gl_color3f(0.5, 0.5, 1.0)

      # draw quad
      GL11.gl_begin(GL11::GL_QUADS)
      GL11.gl_vertex2f(100, 100)
      GL11.gl_vertex2f(100 + 200, 100)
      GL11.gl_vertex2f(100 + 200, 100+200)
      GL11.gl_vertex2f(100, 100 + 200)
      GL11.gl_end

      Display.update
    end
    
    Display.destroy
  end
end

quad_example = QuadExample.new
quad_example.start
