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

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.find{|person| person.name == name}
  end

  def self.find_or_create_by_name(name)
    song_found = find_song = find_by_name(name)
    if song_found == nil
      create_song = create_by_name(name)
    else
      find_song = find_by_name(name)
    end
  end

  def self.alphabetical
    puts @@all
    sorted_songs = []
    self.all.each do |data|
      sorted_songs << data
    end
    sorted_songs.sort! { |a, b|  a.name <=> b.name }
  end

  def self.new_from_filename(filename)
    filename_array = filename.split("-")
    song = self.new
    song.name = filename_array[1][1..-5]
    song.artist_name = filename_array[0][0..-2]
    song
  end

  def self.create_from_filename(filename)
    filename_array = filename.split("-")
    song = self.new
    song.name = filename_array[1][1..-5]
    song.artist_name = filename_array[0][0..-2]
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
