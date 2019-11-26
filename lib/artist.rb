class Artist
  
  include Concerns::InstanceMethods
	extend Concerns::ClassMethods
	extend Concerns::Findable
  
  @@all = []
  
  attr_accessor :songs, :name 

  def initialize(name)
		@name = name
    @songs = []
	end
  
  @@all = []
  
  def self.all 
    @@all
  end 
  
  def self.create(name)
		instance = Artist.new(name)
		instance.save
		instance
	end

  def genres
    self.songs.map {|song|song.genre}.uniq
  end

  def add_song(song)
    song.artist = self if song.artist == nil
    self.songs << song if self.songs.include?(song) == false
  end

end