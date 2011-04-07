# Based on tutorial from http://zetcode.com/tutorials/javagamestutorial/basics/

require "java"

include_class "java.awt.BasicStroke"
include_class "java.awt.Color"
include_class "java.awt.RenderingHints"
include_class "java.awt.geom.AffineTransform"
include_class "java.awt.geom.Ellipse2D"

include_class "javax.swing.JPanel"

class Board < JPanel
  def paint(graphics)
    super(graphics)

    # Make the drawing smooth
    rendering_hints = RenderingHints.new(RenderingHints::KEY_ANTIALIASING,
                                         RenderingHints::VALUE_ANTIALIAS_ON)
    rendering_hints.put(RenderingHints::KEY_RENDERING,
                        RenderingHints::VALUE_RENDER_QUALITY)
    graphics.rendering_hints = rendering_hints

    w = self.size.width
    h = self.size.height

    ellipse = Ellipse2D::Double.new(0, 0, 80, 130)

    graphics.stroke = BasicStroke.new(1)
    graphics.color  = Color.gray

    # Rotate ellipse 360 degrees to create a donut
    0.step(360, 5) do |deg|
      affine_transform = AffineTransform.get_translate_instance(w / 2, h / 2)
      affine_transform.rotate(java.lang.Math.to_radians(deg))
      graphics.draw(affine_transform.create_transformed_shape(ellipse))
    end
  end
end
