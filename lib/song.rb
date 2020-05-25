class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end


  def self.create
    song = self.new
    song.save
    song
  end


  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
   song
  end

  
  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    @@all << song
    song
  end

  def self.find_by_name (song_name)
    @@all.find {|a| a.name == song_name}
  end

  def self.find_or_create_by_name (song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical ()
    @@all.sort_by {|a| a.name}
  end

  def self.new_from_filename(filename)
    song_data = filename.sub!(/.mp3/,'').split(' - ')

    song = self.new
    song.artist_name = song_data[0]
    song.name = song_data[1]

    song
  end

  def self.create_from_filename(filename)
    song_data = filename.sub!(/.mp3/,'').split(' - ')

    song = self.create
    song.artist_name = song_data[0]
    song.name = song_data[1]

    song
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end
