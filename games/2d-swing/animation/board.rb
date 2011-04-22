# Adapted from tutorial at http://zetcode.com/tutorials/javagamestutorial/animation/
# but it's not working...

require "java"

include_class "java.awt.Color"
include_class "java.awt.Toolkit"
include_class "java.awt.event.ActionListener"

include_class "javax.swing.JPanel"
include_class "javax.swing.ImageIcon"
include_class "javax.swing.Timer"

class Board < JPanel
  include ActionListener # implement ActionListener interface

  def initialize
    super
    self.background = Color::BLACK
    self.double_buffered = true
    @star = ImageIcon.new("./../images/star.png").image
    @x = @y = 10

    # Timer calls #action_performed every 25ms
    @timer = Timer.new(25, self)
    @timer.start
  end

  def paint(graphics)
    super(graphics)
    graphics.draw_image(@star, @x, @y, self)
    Toolkit.default_toolkit.sync # keeps animation smooth on Linux...?
    graphics.dispose
  end

  # Implementation of method from ActionListner interface. Called by @timer.
  # See http://www.ruby-forum.com/topic/178820 for why we're using java-style naming.
  def actionPerformed(event)
    @x += 1
    @y += 1

    if @y > 240
      @y = -45
      @x = -45
    end

    self.repaint
  end
end
