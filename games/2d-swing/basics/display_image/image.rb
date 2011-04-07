# Based on tutorial from http://zetcode.com/tutorials/javagamestutorial/basics/

require "java"

include_class "javax.swing.JFrame"

require "./board"

class MyImage < JFrame
  def initialize
    super
    self.add(Board.new)
    self.default_close_operation = EXIT_ON_CLOSE
    self.set_size(520, 375)
    self.set_location_relative_to nil # center window
    self.title = "Crab!"
    self.visible = true
  end
end

MyImage.new
