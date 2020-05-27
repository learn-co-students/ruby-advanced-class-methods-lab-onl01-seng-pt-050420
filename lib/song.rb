require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  # instantiates and saves the song, and it returns the new song that was created
  def self.create
    @song = self.new
    @song.save
    @song
  end

  # instantiates a song with a name property
  def self.new_by_name(name)
    @song = self.new
    @song.name = name
    @song
  end

  # instantiates and saves a song with a name property
  def self.create_by_name(name)
    @song = self.new
    @song.save
    @song.name = name
    @song
  end

  # can find a song present in @@all by name
  # returns falsey when a song name is not present in @@all
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by do |song| 
      song.name
    end
  end

  def self.new_from_filename(filename)

    filename_array = filename.split(" - ")

    song_title = filename_array[1].chomp(".mp3")
    artist = filename_array[0]

    @song = self.new
    @song.save
    @song.name = song_title
    @song.artist_name = artist
    @song
  
  end

  def self.create_from_filename(filename)

    filename_array = filename.split(" - ")

    song_title = filename_array[1].chomp(".mp3")
    artist = filename_array[0]

    @song = self.new
    @song.save
    @song.name = song_title
    @song.artist_name = artist
    @song
   
  end

  def self.destroy_all
    @@all.clear
  end


end
