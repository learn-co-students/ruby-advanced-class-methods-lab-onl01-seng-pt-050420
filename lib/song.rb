require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

   def save
    self.all << self
   end
  
   def self.create
  song = self.new
  self.all << song
  song
 end
 
  def self.new_by_name(name)
   song= self.new
    song.name = name
   song
  end
 
 def self.create_by_name(name)
  song = self.create
   song.name = name
    self.all << song
     song
 end
  
 def self.find_by_name(name)
   self.all.find{|person| person.name == name}
end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end
 
def self.destroy_all
  self.all.clear
end

      def self.alphabetical
    golly = self.all.uniq
    golly.sort_by {|songs| songs.name}
  end
  

def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artistsname = parts[0]
    songsname = parts[1][0..-5]

    song = self.new
    song.name = songsname
    song.artist_name = artistsname
    song
  end

  def Song.create_from_filename(filename)
    parts = filename.split(" - ")
    artistsname = parts[0]
    songsname = parts[1][0..-5]

    song = self.create
    song.name = songsname
    song.artist_name = artistsname
    song
  end
end
  

  
  
  #.gsub(".mp3", "")