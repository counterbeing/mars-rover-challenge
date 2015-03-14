require './classes/rover.rb'

describe Rover do 
  it "should respond be instanciated with attributes" do
    rover = Rover.new("1 2 N")
    expect(rover.x).to eq(1)
    expect(rover.y).to eq(2)
    expect(rover.degrees).to eq(0)
  end

  describe "converting cardinals to degrees" do
    it "should convert N to 0" do
      degrees = Rover.cardinal_to_degrees("N")
      expect(degrees).to eq(0)
    end

    it "should convert E to 90" do
      degrees = Rover.cardinal_to_degrees("E")
      expect(degrees).to eq(90)
    end

    it "should convert S to 180" do
      degrees = Rover.cardinal_to_degrees("S")
      expect(degrees).to eq(180)
    end
  end

  describe "converting degrees to cardinals" do
    it "should convert 180 to S" do
      cardinal = Rover.degrees_to_cardinal(180)
      expect(cardinal).to eq("S")
    end
    
    it "should convert 0 to N" do
      cardinal = Rover.degrees_to_cardinal(0)
      expect(cardinal).to eq("N")
    end
  end

  describe "following directions" do
    let(:rover) { Rover.new("0 0 N")}
    it "should move when recieving m command" do 
      expect(rover).to receive(:move)
      rover.follow_directions("M")
    end
    it "should move when recieving a compound command" do 
      expect(rover).to receive(:move)
      expect(rover).to receive(:turn_left)
      expect(rover).to receive(:turn_right)
      rover.follow_directions("RML")
    end

    it "should work with the original specifications" do
      rover1 =  Rover.new("1 2 N")
      rover1.follow_directions("LMLMLMLMM")
      expect(rover1.output_coordinates).to eq("1 3 N")
      rover2 =  Rover.new("3 3 E")
      rover2.follow_directions("MMRMMRMRRM")
      expect(rover2.output_coordinates).to eq("5 1 E")
    end
  end

  describe "moving" do 
    let(:rover) { Rover.new("0 0 N")}
    it "should turn left" do
      rover.turn_left
      expect(rover.degrees).to eq(270)
      rover.turn_left
      expect(rover.degrees).to eq(180)
    end

    it "should turn right" do
      rover.turn_right
      expect(rover.degrees).to eq(90)
      rover.turn_right
      expect(rover.degrees).to eq(180)
    end

    describe "according to its orientation" do
      it "facing north and moving should increase y value" do
        rover.move
        expect(rover.y).to eq(1)
      end

      it "facing east and moving should increase x value" do
        rover.degrees = 90
        rover.move
        expect(rover.x).to eq(1)
      end
    end
  end
end
