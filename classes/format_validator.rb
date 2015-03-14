class FormatValidator
  def self.plateau_dimensions(string)
    unless string =~ /^\d+ \d+$/
      raise "Your plateau dimensions should be something like '5 5'"
    end
  end

  def self.rover_location(string)
    unless string =~ /^\d+ \d+ (N|S|E|W)$/
      raise "Your rover location should be something like '5 4 E'"
    end
  end

  def self.rover_command(string)
    unless string =~ /^(M|L|R)+$/
      raise "Your rover command should be something like 'MRMLRM'"    
    end
  end
end
