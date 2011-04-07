require "java"
include_class "javax.swing.JFrame"

class Window < JFrame
  def initialize
    super # can't call java methods here without this
    self.title = "My Window"
    self.default_close_operation = EXIT_ON_CLOSE
    self.set_size(300, 280)
    self.location_relative_to = nil
    self.visible = true
    self.resizable = true
  end
end

Window.new
