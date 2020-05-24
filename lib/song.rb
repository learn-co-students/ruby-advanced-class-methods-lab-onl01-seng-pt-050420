class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  
  
  def self.create
    song = Song.new 
    song.save
    song
  end
  
  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song.save
    song
  end
  
  def self.create_by_name(song_name)
    song = Song.new
    song.name = song_name
    song.save
    song
  end
  
  def self.find_by_name(query)
    self.all.find{|song|
      song.name == query
    }
    
  end
  
  def self.find_or_create_by_name(query)
    if self.find_by_name(query)
      self.find_by_name(query)
    else
      self.create_by_name(query)
    end
  end
  
  
  def self.alphabetical
    self.all.sort_by(&:name)
  end

  def self.all
    @@all
  end
  
  def self.new_from_filename(file)
    song_title = file.split("-")
    song_title = song_title.join
    song_title = song_title.split(".mp3").join
    song_title = song_title.split("  ")
    song = Song.new 
    song.name = song_title[1]
    song.artist_name = song_title[0]
    song.save
    song
  end
  
  def self.create_from_filename(file)
    song_title = file.split("-")
    song_title = song_title.join
    song_title = song_title.split(".mp3").join
    song_title = song_title.split("  ")
    song = Song.new 
    song.name = song_title[1]
    song.artist_name = song_title[0]
    song.save
    song
  end
    

  def save
    self.class.all << self
  end
  
  def self.destroy_all
    self.all.clear
  end

end
