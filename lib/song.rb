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
    song = Song.new
    if !(self.all.include?(song))
      self.all << song
    end
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    if !(self.all.include?(song))
      self.all << song
    end
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(name)  
    song = Song.new
    name_parts = name.split(" - ")
    song.artist_name = name_parts[0]
    song.name = name_parts[1].chomp(".mp3")
    song
  end 

  def self.create_from_filename(name)
    song = Song.new
    name_parts = name.split(" - ")
    song.artist_name = name_parts[0]
    song.name = name_parts[1].chomp(".mp3")
    self.all << song
    song
  end

  def self.destroy_all
    @@all = []
  end

end
