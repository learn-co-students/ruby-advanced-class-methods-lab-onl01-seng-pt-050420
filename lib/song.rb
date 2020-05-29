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
    @song = self.new
    @song.save
    @song
  end
  
  def self.new_by_name(name)
    @song = self.new
    @song.name = name
    @song
  end
  
  def self.create_by_name(name)
    @song = self.new
    @song.save 
    @song.name = name
    @song
  end
  
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    @song = self.new
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(song_name)
    name_array = song_name.sub!(/.mp3/,"").split(" - ") 
    # needed a lil' regex razzle dazzle
    @song = self.new 
    @song.artist_name = name_array[0] 
    # the artist's name is the first element in the array, so index = 0 
    @song.name = name_array[1]
    @song
  end
  
  def self.create_from_filename(song_name)
    name_array = song_name.sub!(/.mp3/,"").split(" - ") 
    @song = self.new 
    @song.save
    @song.artist_name = name_array[0] 
    @song.name = name_array[1]
    @song
  end
  
  def self.destroy_all
    @@all.clear
  end
end
