class Genre 
  extend Findable::ClassMethods
  include::InstanceMethods
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end 
  
  def self.all
    @@all
  end 
  
  def save
    @@all << self
  end 
  
  def destroy_all
    @@all.clear
  end 
  
  def create
    Genre.new(genre)
    save
  end 
  
  def artists
    Song.all.map do |song|
      song.artist 
    end 
  end
  
end 