require './classes/plateau.rb'

describe Plateau do 
  let(:plateau) { Plateau.new("5 5") }

  it "can be initialized" do
    expect(plateau.x).to eq(5)
    expect(plateau.y).to eq(5)
  end

  describe "checks for solid ground" do
    it "returns false when the point is not on the plateau" do
      ground = plateau.check_for_solid_ground(6,6)
      expect(ground).to be_falsey
    end

    it "returns true when the point is on the edge of the plateau" do
      ground = plateau.check_for_solid_ground(5,5)
      expect(ground).to be_truthy
    end

    it "returns true when the point is on the plateau" do
      ground = plateau.check_for_solid_ground(4,4)
      expect(ground).to be_truthy
    end
  end
end
