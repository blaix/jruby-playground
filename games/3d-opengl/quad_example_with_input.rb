# Heavily adapted from http://lwjgl.org/wiki/index.php?title=LWJGL_Basics_3_(The_Quad)
# Plus keyboard input to make it move with arrow keys!

require "java"
require "lwjgl/jar/lwjgl.jar"

include_class "org.lwjgl.LWJGLException"
include_class "org.lwjgl.opengl.Display"
include_class "org.lwjgl.opengl.DisplayMode"
include_class "org.lwjgl.opengl.GL11"
include_class "org.lwjgl.input.Keyboard"

class QuadExample
  SPEED = 1
  QUAD_SIZE = 50
  DISPLAY_X = 800
  DISPLAY_Y = 600
  
  def initialize
    super
    @quit = false
    @x = @y = 100
    @moving = {
      :north => false,
      :south => false,
      :east => false,
      :west => false
    }
  end
  
  def start
    setup_display
    setup_opengl
    run_game until quit?
    Display.destroy
  end
  
  private
  
  def setup_display
    Display.display_mode = DisplayMode.new(800, 600)
    Display.create
  rescue LWJGLException => e
    e.print_stack_trace
    exit 0
  end

  def run_game
    poll_input
    update_position
    draw_quad
    Display.update
  end
  
  # Initialize a 2D view (clipping between 1 and -1) with opengl
  # TODO: I still need to wrap my head around this stuff...
  def setup_opengl
    GL11.gl_matrix_mode(GL11::GL_PROJECTION)
    GL11.gl_load_identity
    GL11.gl_ortho(0, DISPLAY_X, DISPLAY_Y, 0, 1, -1)
    GL11.gl_matrix_mode(GL11::GL_MODELVIEW)
  end

  def poll_input
    if Keyboard.next
      key = Keyboard.event_key
      key_state = Keyboard.event_key_state # true on key down, false on key up
      @moving[:east] = key_state if key == Keyboard::KEY_RIGHT
      @moving[:west] = key_state if key == Keyboard::KEY_LEFT
      @moving[:north] = key_state if key == Keyboard::KEY_UP
      @moving[:south] = key_state if key == Keyboard::KEY_DOWN
      @quit = true if key == Keyboard::KEY_ESCAPE
    end
  end
  
  def update_position
    @x += SPEED if @moving[:east] && @x + QUAD_SIZE < DISPLAY_X
    @x -= SPEED if @moving[:west] && @x > 0
    @y -= SPEED if @moving[:north] && @y > 0
    @y += SPEED if @moving[:south] && @y + QUAD_SIZE < DISPLAY_Y
  end
  
  def draw_quad
    # Clear the screen and depth buffer
    GL11.gl_clear(GL11::GL_COLOR_BUFFER_BIT | GL11::GL_DEPTH_BUFFER_BIT)

    # set the color of the quad (R,G,B,A)
    GL11.gl_color3f(0.5, 0.5, 1.0)
    
    GL11.gl_begin(GL11::GL_QUADS)
    GL11.gl_vertex2f(@x, @y)
    GL11.gl_vertex2f(@x + QUAD_SIZE, @y)
    GL11.gl_vertex2f(@x + QUAD_SIZE, @y + QUAD_SIZE)
    GL11.gl_vertex2f(@x, @y + QUAD_SIZE)
    GL11.gl_end
  end
  
  def quit?
    @quit || Display.close_requested?
  end
end

quad_example = QuadExample.new
quad_example.start
