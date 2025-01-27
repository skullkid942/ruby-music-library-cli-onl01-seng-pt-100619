class Song
  
  include Concerns::InstanceMethods
	extend Concerns::ClassMethods
	extend Concerns::Findable
  
  attr_accessor :name 
  attr_reader :artist, :genre
  
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end
  
  def self.all 
    @@all 
  end 

  def self.create(name)
    instance = Song.new(name)
    instance.save
    instance
  end

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    self.genre.add_song(self)
  end

  def self.new_from_filename(file_name)
    file_bits = file_name.gsub(/(\.mp3)/,'')
    file_bits = file_bits.split(" - ")
    artist = Artist.find_or_create_by_name(file_bits[0])
    genre = Genre.find_or_create_by_name(file_bits[2])
    song = Song.find_or_create_by_name(file_bits[1])
    song.genre = genre
    song.artist = artist
    song
  end

  def self.create_from_filename(file_name)
    file = Song.new_from_filename(file_name)
    file.save
    file
  end

  

end