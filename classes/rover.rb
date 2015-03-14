class Rover
  attr_accessor :x, :y, :degrees
  DIRECTIONS = {
    n: {degrees: 0,   movement: proc {|rover| rover.y = rover.y + 1}},
    e: {degrees: 90,  movement: proc {|rover| rover.x = rover.x + 1}},
    s: {degrees: 180, movement: proc {|rover| rover.y = rover.y - 1}},
    w: {degrees: 270, movement: proc {|rover| rover.x = rover.x - 1}}
  }
  
  def initialize(coordinate_string, plateau=nil)
    FormatValidator.rover_location(coordinate_string)
    coordinate_array = coordinate_string.split
    @x       = coordinate_array[0].to_i
    @y       = coordinate_array[1].to_i
    @degrees = Rover.cardinal_to_degrees(coordinate_array[2])
    @plateau = plateau
  end

  def self.cardinal_to_degrees(cardinal)
    DIRECTIONS[cardinal.downcase.to_sym][:degrees]
  end

  def self.degrees_to_cardinal(degrees)
    DIRECTIONS.select {|k,v| v[:degrees] == degrees}.keys.first.to_s.upcase
  end

  def follow_directions(direction_string)
    FormatValidator.rover_command(direction_string)
    direction_string.downcase!
    direction_string.split('').each do |command|
      case command
      when "m"
        self.move
      when "l"
        self.turn_left
      when "r"
        self.turn_right
      end
    end
  end

  def turn_right
    @degrees = @degrees + 90
    @degrees = (@degrees + 360) % 360
  end

  def turn_left
    @degrees = @degrees - 90
    @degrees = (@degrees + 360) % 360
  end

  def move
    cardinal = Rover.degrees_to_cardinal(@degrees) 
    DIRECTIONS[cardinal.downcase.to_sym][:movement].call(self)
    unless @plateau.nil?
      unless @plateau.check_for_solid_ground(self.x, self.y)
        puts "Whoops, you drove off the Plateau! Rocket boosters enabled!"
      end
    end
  end

  def output_coordinates
    "#{@x} #{@y} #{Rover.degrees_to_cardinal(@degrees)}"
  end
end

