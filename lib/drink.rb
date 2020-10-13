class Drink
    attr_accessor :name, :instructions, :glass, :german_instructions

    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all 
    end

end