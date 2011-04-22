# Based on tutorial from http://zetcode.com/tutorials/javagamestutorial/animation/

require "java"

include_class "javax.swing.JFrame"

require "./board.rb"

class Star < JFrame
  def initialize
    super
    self.add(Board.new)
    self.default_close_operation = EXIT_ON_CLOSE
    self.set_size(280, 240)
    self.set_location_relative_to nil
    self.title = "Star"
    self.resizable = false
    self.visible = true
  end
end

Star.new
