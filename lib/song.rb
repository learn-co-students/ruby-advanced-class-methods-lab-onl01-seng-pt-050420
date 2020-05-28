require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new 
    @@all << song
    song 
  end
  
  def self.new_by_name(string_name)
    song = self.new 
    song.name = string_name
    song 
  end
    
  def self.create_by_name(string_name)
    song = self.new 
    song.name = string_name
    @@all << song
    song
  end
  
  def self.find_by_name(string_name)
    @@all.find{|song|  song.name == string_name}
  end
  
  def self.find_or_create_by_name(string_name)
    if self.find_by_name(string_name) 
      return self.find_by_name(string_name)
    else
      self.create_by_name(string_name)
    end
  end
  
  def self.alphabetical
    @@all.sort_by { |name| name.name }
  end
  
  def self.new_from_filename(string)
    song = self.new
    @@all << song 
    song_array = string.split(/ - /)
    song.artist_name = song_array[0]
        ##song.name = song_array[1].split(".")[0]
    song.name = song_array[1].gsub(".mp3","")
    song 
  end
  
  def self.create_from_filename(string)
    new_from_filename(string)
  end
  
  def self.destroy_all
    @@all.clear
  end
end
