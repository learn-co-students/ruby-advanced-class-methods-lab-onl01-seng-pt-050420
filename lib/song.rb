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
    @@all.find{ |song| song.name == name }
  end
  
  def self.find_or_create_by_name(name)
    if song = self.find_by_name(name) 
      song
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{ |song| song.name }
  end
  
 def self.new_from_filename(filename)
   
   if filename.include?(".mp3")
      array = filename.chomp(".mp3").split(" - ")
      music = array[1]
      singer = array[0]
      @song = self.new
      @song.save
      @song.name = music
      @song.artist_name = singer
    end
    @song
  end
  
  def self.create_from_filename(filename)
    @@all <<  self.new_from_filename(filename)
  end
  
  def self.destroy_all
    self.all.clear
  end

end
