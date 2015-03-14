require "./classes/format_validator.rb"

describe FormatValidator do
  describe "plateau_dimensions" do
    it "should fail with a one integer" do
      expect{FormatValidator.plateau_dimensions("5")}.to raise_error
    end
    it "should fail with letters" do
      expect{FormatValidator.plateau_dimensions("topleft")}.to raise_error
    end
    it "should succeeed with appropriate format" do
      expect{FormatValidator.plateau_dimensions("5 5")}.to_not raise_error
    end
  end

  describe "rover_location" do
    it "should fail with a one integer" do
      expect{FormatValidator.rover_location("5")}.to raise_error
    end
    it "should fail with letters" do
      expect{FormatValidator.rover_location("topleft")}.to raise_error
    end
    it "should succeeed with appropriate format" do
      expect{FormatValidator.rover_location("5 5 N")}.to_not raise_error
    end
  end

  describe "rover_command" do
    it "should fail with a one integer" do
      expect{FormatValidator.rover_command("5")}.to raise_error
    end
    it "should fail with off letters" do
      expect{FormatValidator.rover_command("GB")}.to raise_error
    end
    it "should succeeed with appropriate format" do
      expect{FormatValidator.rover_command("MRMLRM")}.to_not raise_error
    end
  end
end
