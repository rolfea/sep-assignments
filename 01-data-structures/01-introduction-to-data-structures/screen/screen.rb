require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height
    @pixel_coordinates = []
    @inserted_pixels = []
  end

  # parallel list


  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    coordinates = []
    pixels = []
    coordinates << x
    coordinates << y
    pixels << pixel
    @pixel_coordinates << coordinates
    @inserted_pixels << pixels
  end

  def at(x, y)
    @pixel_coordinates.each do |coordinate|
      if (coordinate[0] == x && coordinate[1] == y)
        return @inserted_pixels[@pixel_coordinates.index(coordinate)]
      end
    end
    return nil
  end

  private

  def inbounds(x, y)
  end

end
