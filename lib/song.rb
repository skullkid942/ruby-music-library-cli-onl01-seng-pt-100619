class Song 
  extend::ClassMethods
  
  attr_accessor :name, :artist, :genre 
  
  @@all =[]
  
  def initialize(:name, artist = nil,genre = nil)
    @name = name
    @artist = artist
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
    song = Song.new(song)
    save
    song 
  end 
end 