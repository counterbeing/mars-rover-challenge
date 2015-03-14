class Plateau
  attr_accessor :x, :y
  def initialize(coordinate_string)
    coordinate_array = coordinate_string.split()
    @x = coordinate_array[0].to_i
    @y = coordinate_array[1].to_i
  end

  def check_for_solid_ground(x,y)
    x.between?(0, self.x) &&
    y.between?(0, self.y)
  end
end

