class Artist 
  extend Findable::ClassMethods
  include Findable::InstanceMethods
  
  attr_accessor :name, :genre  
  
  @@all = []
  
  def initialize(name)
    @name = name
  end 
  
  def self.all 
    @@all
  end 
  
  def destroy_all
    @@all.clear
  end 
  
  def save
    @@all << self 
  end
  
  def create
    Artist.new(artist)
    save
  end 
  
  def add_song(song,genre)
    Song.new(song,self,genre)
    save
    song 
  end
  
  def genres 
    Song.all.map do |song|
      song.genre
    end 
  end
  
end 