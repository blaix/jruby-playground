# Based on tutorial from http://zetcode.com/tutorials/javagamestutorial/basics/

require "java"

include_class "javax.swing.JFrame"

require "./board"

class Donut < JFrame
  def initialize
    super # Ruby classes inheriting from java classes can't
          # call java methods without calling super first.
    self.add(Board.new)
    self.title = "Donut"
    self.default_close_operation = EXIT_ON_CLOSE
    self.set_size(360, 310)
    self.set_location_relative_to nil # center the window
    self.visible = true
    self.resizable = false
  end
end

Donut.new
