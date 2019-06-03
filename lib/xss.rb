class Xss
    def self.hash
      myHash=Hash.new()
      myHash[:x000001]="Hexa"
      puts myHash[:x000001]
    end
    def self.hi
      puts "Hello world!"
    end
    def self.version
      puts "0.1.3"
    end
  end