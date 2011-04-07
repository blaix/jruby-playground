# Based on tutorial from http://zetcode.com/tutorials/javagamestutorial/basics/

require "java"

include_class "javax.swing.ImageIcon"
include_class "javax.swing.JPanel"

class Board < JPanel
  def initialize
    super
    @crab = ImageIcon.new("./../../images/crab.jpg").image
  end

  def paint(graphics)
    graphics.draw_image(@crab, 10, 10, nil)
  end
end
