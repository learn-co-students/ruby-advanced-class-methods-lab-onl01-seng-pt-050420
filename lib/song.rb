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
    self.all << self.new
    self.all.last
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end
  
  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    song_value = self.find_by_name(song_name)
    song_value ? song_value : self.create_by_name(song_name)
  end
  
  def self.alphabetical
    self.all.sort_by {|instance| instance.name}
  end
  
  def self.new_from_filename(song_mp3)
    array = song_mp3.split(/[.-]/).map{|i|i.strip}
    song_instance = self.new
    song_instance.name = array[1]
    song_instance.artist_name = array[0]
    song_instance
  end
  
  def self.create_from_filename(song_mp3)
    song_instance = self.new_from_filename(song_mp3)
    self.all << song_instance
  end
  
  def self.destroy_all
    self.all.clear
  end
end